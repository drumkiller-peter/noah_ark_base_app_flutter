import 'package:dio/dio.dart';
import 'package:noah_ark_base_app_flutter/src/core/di/dependency_injection.dart';
import 'package:noah_ark_base_app_flutter/src/core/network/api_client.dart';
import 'package:noah_ark_base_app_flutter/src/core/network/auth_interceptor.dart';

void initNetwork() {
  getIt
    ..registerLazySingleton<AuthInterceptor>(
      () => AuthInterceptor(tokenStorage: getIt(), appConfig: getIt()),
    )
    ..registerLazySingleton<Dio>(
      () => createDio(
        appConfig: getIt(),
        interceptors: [getIt<AuthInterceptor>()],
      ),
      dispose: (dio) => dio.close(),
    );
}
