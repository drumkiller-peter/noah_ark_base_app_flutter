import 'package:flutter_secure_storage/flutter_secure_storage.dart';

/// Secure local token storage using platform-native keychains/keystores.
class TokenStorage {
  static const String _keyAccessToken = 'access_token';
  static const String _keyRefreshToken = 'refresh_token';
  static const String _keyGuestToken = 'guest_token';
  static const String _keyUserRole = 'user_role';

  final FlutterSecureStorage _storage;

  const TokenStorage({FlutterSecureStorage? storage})
      : _storage = storage ??
            const FlutterSecureStorage(
              aOptions: AndroidOptions(encryptedSharedPreferences: true),
            );

  Future<void> saveUserTokens({
    required String accessToken,
    required String refreshToken,
    String? userRole,
  }) async {
    await _storage.write(key: _keyAccessToken, value: accessToken);
    await _storage.write(key: _keyRefreshToken, value: refreshToken);
    if (userRole != null) {
      await _storage.write(key: _keyUserRole, value: userRole);
    }
  }

  Future<void> saveUserRole(String userRole) =>
      _storage.write(key: _keyUserRole, value: userRole);

  Future<void> saveGuestToken(String guestToken) async {
    await _storage.write(key: _keyGuestToken, value: guestToken);
  }

  Future<String?> getAccessToken() => _storage.read(key: _keyAccessToken);
  Future<String?> getRefreshToken() => _storage.read(key: _keyRefreshToken);
  Future<String?> getGuestToken() => _storage.read(key: _keyGuestToken);
  Future<String?> getUserRole() => _storage.read(key: _keyUserRole);

  Future<void> clearUserSession() async {
    await _storage.delete(key: _keyAccessToken);
    await _storage.delete(key: _keyRefreshToken);
    await _storage.delete(key: _keyUserRole);
  }

  Future<void> clearAll() => _storage.deleteAll();
}
