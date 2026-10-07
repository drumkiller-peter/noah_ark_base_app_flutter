import 'package:envied/envied.dart';

part 'env.g.dart';

/// Build settings read from the git-ignored `.env` at code-generation time
/// (copy `.env.example`). After editing `.env`, run
/// `dart run build_runner build -d`. A missing file or key reads as empty, and
/// [AppConfig] falls back to its defaults.
@Envied(path: '.env')
abstract class Env {
  @EnviedField(varName: 'TENANT_KEY', defaultValue: '')
  static const String tenantKey = _Env.tenantKey;

  @EnviedField(varName: 'API_BASE_URL', defaultValue: '')
  static const String apiBaseUrl = _Env.apiBaseUrl;

  @EnviedField(varName: 'CHURCH_NAME', defaultValue: '')
  static const String churchName = _Env.churchName;

  @EnviedField(varName: 'CLIENT_ID', obfuscate: true, defaultValue: '')
  static final String clientId = _Env.clientId;

  @EnviedField(varName: 'CLIENT_SECRET', obfuscate: true, defaultValue: '')
  static final String clientSecret = _Env.clientSecret;
}
