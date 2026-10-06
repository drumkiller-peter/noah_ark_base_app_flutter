import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:noah_ark_base_app_flutter/src/app.dart';
import 'package:noah_ark_base_app_flutter/src/core/config/app_config.dart';
import 'package:noah_ark_base_app_flutter/src/core/database/app_database.dart';
import 'package:noah_ark_base_app_flutter/src/core/network/api_client.dart';
import 'package:noah_ark_base_app_flutter/src/core/security/token_storage.dart';
import 'package:noah_ark_base_app_flutter/src/core/theme/theme_repository.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  // 1. Resolve tenant configuration (baked vs dynamic)
  final appConfig = AppConfig.initialize();

  // 2. Initialize encrypted token storage
  const tokenStorage = TokenStorage();

  // 3. Initialize offline Drift SQLite database
  final database = AppDatabase();

  // 4. Initialize HTTP network client with queued auth interceptor
  final apiClient = ApiClient(appConfig: appConfig, tokenStorage: tokenStorage);

  // 5. Pick the church's colors before the first frame. Until runApp draws,
  //    the native splash screen stays up, so a first launch waits there for
  //    at most about two seconds while the Theme is fetched.
  final churchTheme = await ThemeRepository(
    apiClient: apiClient,
    db: database,
    appConfig: appConfig,
  ).themeForLaunch();

  runApp(
    EasyLocalization(
      supportedLocales: const [Locale('en-US', 'US'), Locale('ne-NP', 'NP')],
      path: 'assets/translations',
      fallbackLocale: const Locale('en-US', 'US'),
      child: NoahArkApp(
        appConfig: appConfig,
        database: database,
        apiClient: apiClient,
        tokenStorage: tokenStorage,
        churchTheme: churchTheme,
      ),
    ),
  );
}
