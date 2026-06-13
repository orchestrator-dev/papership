import 'dart:io';
import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:dio_smart_retry/dio_smart_retry.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';

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
    if (config.trustSelfSigned || config.caCertPath != null || config.clientCertPath != null) {
      dio.httpClientAdapter = IOHttpClientAdapter(
        createHttpClient: () {
          final SecurityContext context = SecurityContext(withTrustedRoots: true);

          if (config.caCertPath != null) {
            context.setTrustedCertificates(config.caCertPath!);
          }

          if (config.clientCertPath != null) {
            // Note: If credentials.certificateBase64 is available, we could use that.
            // But per specs, we use clientCertPath from config.
            context.useCertificateChain(config.clientCertPath!, password: config.clientCertPassword);
            context.usePrivateKey(config.clientCertPath!, password: config.clientCertPassword);
          }

          final client = HttpClient(context: context);
          
          if (config.trustSelfSigned) {
            client.badCertificateCallback = (X509Certificate cert, String host, int port) {
              // TODO: show warning banner in UI as per spec
              return true;
            };
          }
          return client;
        },
      );
    }

    // 4. Cache interceptor (5-min TTL)
    final cacheOptions = CacheOptions(
      store: MemCacheStore(),
      policy: CachePolicy.request,
      hitCacheOnErrorExcept: [401, 403],
      maxStale: const Duration(minutes: 5),
      priority: CachePriority.normal,
      cipher: null,
      keyBuilder: CacheOptions.defaultCacheKeyBuilder,
      allowPostMethod: false,
    );
    dio.interceptors.add(DioCacheInterceptor(options: cacheOptions));

    // 5. Retry interceptor
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
