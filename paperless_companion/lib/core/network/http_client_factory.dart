import 'dart:io';
import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:dio_smart_retry/dio_smart_retry.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../auth/auth_strategy.dart';
import '../auth/server_config.dart';
import 'auth_interceptor.dart';

class PaperlessHttpClientFactory {
  final void Function()? onAuthFailure;

  PaperlessHttpClientFactory({this.onAuthFailure});

  Dio createClient(
    ServerConfig config,
    AuthStrategy strategy,
    AuthCredentials credentials,
  ) {
    final dio = Dio(
      BaseOptions(
        baseUrl: config.baseUrl,
        connectTimeout: const Duration(seconds: 15),
        receiveTimeout: const Duration(seconds: 60),
        sendTimeout: const Duration(seconds: 120),
      ),
    );

    // 1. Apply auth interceptor
    dio.interceptors.add(
      AuthInterceptor(
        strategy: strategy,
        credentials: credentials,
        dio: dio,
        onAuthFailure: onAuthFailure,
      ),
    );

    // 2. Apply custom headers
    if (config.customHeaders != null) {
      dio.options.headers.addAll(config.customHeaders!);
    }

    // 3. Configure TLS
    if (config.trustSelfSigned) {
      dio.httpClientAdapter = IOHttpClientAdapter(
        createHttpClient: () {
          final client = HttpClient();
          client.badCertificateCallback =
              (X509Certificate cert, String host, int port) => true;
          return client;
        },
      );
    }

    // 4. Retry interceptor
    dio.interceptors.add(
      RetryInterceptor(
        dio: dio,
        logPrint: print,
        retries: 3,
        retryDelays: const [
          Duration(seconds: 1),
          Duration(seconds: 2),
          Duration(seconds: 4),
        ],
        retryEvaluator: (error, attempt) {
          if (error.type == DioExceptionType.connectionTimeout ||
              error.type == DioExceptionType.receiveTimeout ||
              error.type == DioExceptionType.sendTimeout ||
              error.type == DioExceptionType.connectionError) {
            return true;
          }
          if (error.response != null) {
            final statusCode = error.response?.statusCode;
            if (statusCode != null && statusCode >= 500 && statusCode < 600) {
              return true;
            }
          }
          return false;
        },
      ),
    );

    // 5. Logging in debug mode
    if (kDebugMode) {
      dio.interceptors.add(
        PrettyDioLogger(
          requestHeader: true,
          requestBody: true,
          responseHeader: true,
        ),
      );
    }

    return dio;
  }
}
