import 'package:dio/dio.dart';
import 'package:drugstore_demo/core/app_config/constans.dart';
import 'package:drugstore_demo/core/getit_config.dart';
import 'package:flutter/foundation.dart';

import 'logging_interceptor.dart';

class DioConfig {
  DioConfig._();

  static Future<void> initial() async {
    getIt.registerLazySingleton(() => LoggingInterceptor());
    getIt.registerLazySingleton<Dio>(() {
      final Dio dio = Dio(
        BaseOptions(
          connectTimeout: Duration(milliseconds: connectTimeout),
          receiveTimeout: Duration(milliseconds: connectTimeout),
          headers: headers,
        ),
      );

      if (kDebugMode) {
        dio.interceptors.add(
          getIt<LoggingInterceptor>(),
        );
      }

      return dio;
    });
  }

  
}
