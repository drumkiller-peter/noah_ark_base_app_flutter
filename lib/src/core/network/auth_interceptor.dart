import 'package:dio/dio.dart';
import 'package:noah_ark_base_app_flutter/src/core/config/app_config.dart';
import 'package:noah_ark_base_app_flutter/src/core/network/api_endpoints.dart';
import 'package:noah_ark_base_app_flutter/src/core/security/token_storage.dart';

/// QueuedInterceptor handling tenant key injection and atomic token refresh with guest fallback.
///
/// Token calls (refresh, guest token) and the replay of the failed request go
/// through [_tokenDio], a plain client with no interceptors. Sending them
/// through the intercepted client instead would deadlock the moment one of
/// them failed: its error would queue behind the very `onError` call that is
/// waiting for it.
class AuthInterceptor extends QueuedInterceptor {
  final TokenStorage tokenStorage;
  final AppConfig appConfig;
  final Dio _tokenDio;

  AuthInterceptor({
    required this.tokenStorage,
    required this.appConfig,
  }) : _tokenDio = Dio(
          BaseOptions(
            baseUrl: appConfig.apiBaseUrl,
            connectTimeout: const Duration(seconds: 15),
            receiveTimeout: const Duration(seconds: 15),
            headers: {
              'Content-Type': 'application/json',
              'Accept': 'application/json',
              'X-Tenant-Key': appConfig.tenantKey,
            },
          ),
        );

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    // Injects X-Tenant-Key header across all requests
    options.headers['X-Tenant-Key'] = appConfig.tenantKey;

    // Use User Access Token if available, otherwise fallback to Guest Token
    final userToken = await tokenStorage.getAccessToken();
    if (userToken != null && userToken.isNotEmpty) {
      options.headers['Authorization'] = 'Bearer $userToken';
    } else {
      final guestToken = await tokenStorage.getGuestToken();
      if (guestToken != null && guestToken.isNotEmpty) {
        options.headers['Authorization'] = 'Bearer $guestToken';
      }
    }

    return handler.next(options);
  }

  @override
  Future<void> onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) async {
    if (err.response?.statusCode == 401) {
      final refreshToken = await tokenStorage.getRefreshToken();

      // If user session exists, attempt token refresh rotation
      if (refreshToken != null && refreshToken.isNotEmpty) {
        try {
          final refreshResponse = await _tokenDio.post<Map<String, dynamic>>(
            ApiEndpoints.refreshToken,
            data: {'refresh_token': refreshToken},
          );

          if (refreshResponse.statusCode == 200 && refreshResponse.data != null) {
            final data = refreshResponse.data!;
            final newAccessToken = data['access_token'] as String;
            final newRefreshToken = data['refresh_token'] as String;

            await tokenStorage.saveUserTokens(
              accessToken: newAccessToken,
              refreshToken: newRefreshToken,
            );

            return handler.resolve(await _replay(err.requestOptions, newAccessToken));
          }
        } catch (_) {
          // Token refresh failed or revoked — clear stale session
          await tokenStorage.clearUserSession();
        }
      }

      // Fallback: exchange the app's client credentials for a fresh guest token
      if (appConfig.hasClientCredentials) {
        try {
          final guestResponse = await _tokenDio.post<Map<String, dynamic>>(
            ApiEndpoints.guestToken,
            data: {
              'client_id': appConfig.clientId,
              'client_secret': appConfig.clientSecret,
              // Required for a platform client; a church's own client may name only its church.
              'tenant_key': appConfig.tenantKey,
            },
          );

          if (guestResponse.statusCode == 200 && guestResponse.data != null) {
            final newGuestToken = guestResponse.data!['access_token'] as String;
            await tokenStorage.saveGuestToken(newGuestToken);
            return handler.resolve(await _replay(err.requestOptions, newGuestToken));
          }
        } catch (_) {
          // Fallthrough if guest token exchange also fails
        }
      }
    }

    return handler.next(err);
  }

  /// Sends the failed request again with [token], bypassing this interceptor.
  Future<Response<dynamic>> _replay(RequestOptions options, String token) {
    options.headers['Authorization'] = 'Bearer $token';
    return _tokenDio.fetch<dynamic>(options);
  }
}
