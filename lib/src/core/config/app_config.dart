import 'package:flutter/foundation.dart';

/// Application and Tenant Configuration.
/// Supports both compile-time baked values (--dart-define) and dynamic runtime resolution.
class AppConfig {
  static const String _defaultTenantKey = 'noah-ark';
  static const String _defaultBaseUrl = 'http://127.0.0.1:8000/api/v1';

  final String tenantKey;
  final String apiBaseUrl;
  final bool isBaked;
  final String churchName;

  /// The app's API client credentials, exchanged for a guest token so public
  /// content (and the church's Theme) loads before anyone signs in. Issued by
  /// the backend's `scripts.generate_api_client`; empty when not baked in.
  final String clientId;
  final String clientSecret;

  const AppConfig({
    required this.tenantKey,
    required this.apiBaseUrl,
    required this.isBaked,
    this.churchName = 'Noah Ark Fellowship',
    this.clientId = '',
    this.clientSecret = '',
  });

  /// Initializes the AppConfig, checking environment definitions first.
  static AppConfig initialize() {
    const bakedKey = String.fromEnvironment('TENANT_KEY');
    const bakedBaseUrl = String.fromEnvironment('API_BASE_URL');
    const bakedName = String.fromEnvironment('CHURCH_NAME');
    const bakedClientId = String.fromEnvironment('CLIENT_ID');
    const bakedClientSecret = String.fromEnvironment('CLIENT_SECRET');

    final hasBakedKey = bakedKey.isNotEmpty;
    final resolvedTenantKey = hasBakedKey ? bakedKey : _resolveDynamicTenantKey();
    final resolvedBaseUrl = bakedBaseUrl.isNotEmpty ? bakedBaseUrl : _defaultBaseUrl;
    final resolvedName = bakedName.isNotEmpty ? bakedName : 'Noah Ark Fellowship';

    return AppConfig(
      tenantKey: resolvedTenantKey,
      apiBaseUrl: resolvedBaseUrl,
      isBaked: hasBakedKey,
      churchName: resolvedName,
      clientId: bakedClientId,
      clientSecret: bakedClientSecret,
    );
  }

  /// Whether the app can ask the backend for a guest token.
  bool get hasClientCredentials => clientId.isNotEmpty && clientSecret.isNotEmpty;

  /// In Web environments, extract subdomain from hostname; otherwise fallback to default.
  static String _resolveDynamicTenantKey() {
    if (kIsWeb) {
      final host = Uri.base.host;
      final parts = host.split('.');
      if (parts.length > 2 && parts.first != 'www') {
        return parts.first;
      }
    }
    return _defaultTenantKey;
  }

  AppConfig copyWith({
    String? tenantKey,
    String? apiBaseUrl,
    bool? isBaked,
    String? churchName,
    String? clientId,
    String? clientSecret,
  }) {
    return AppConfig(
      tenantKey: tenantKey ?? this.tenantKey,
      apiBaseUrl: apiBaseUrl ?? this.apiBaseUrl,
      isBaked: isBaked ?? this.isBaked,
      churchName: churchName ?? this.churchName,
      clientId: clientId ?? this.clientId,
      clientSecret: clientSecret ?? this.clientSecret,
    );
  }
}
