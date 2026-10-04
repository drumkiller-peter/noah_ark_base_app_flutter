import 'package:dio/dio.dart';
import 'package:noah_ark_base_app_flutter/src/core/config/app_config.dart';
import 'package:noah_ark_base_app_flutter/src/core/network/auth_interceptor.dart';
import 'package:noah_ark_base_app_flutter/src/core/security/token_storage.dart';

/// Centralized Dio HTTP client configured for multi-tenancy and automatic token lifecycle.
class ApiClient {
  final Dio dio;

  ApiClient({
    required AppConfig appConfig,
    required TokenStorage tokenStorage,
  }) : dio = Dio(
          BaseOptions(
            baseUrl: appConfig.apiBaseUrl,
            connectTimeout: const Duration(seconds: 15),
            receiveTimeout: const Duration(seconds: 15),
            headers: {
              'Content-Type': 'application/json',
              'Accept': 'application/json',
            },
          ),
        ) {
    dio.interceptors.add(
      AuthInterceptor(
        tokenStorage: tokenStorage,
        appConfig: appConfig,
      ),
    );
  }
}
