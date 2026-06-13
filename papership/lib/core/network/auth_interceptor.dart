import 'package:dio/dio.dart';
import '../auth/auth_strategy.dart';

class AuthInterceptor extends Interceptor {
  final AuthStrategy strategy;
  final AuthCredentials credentials;
  final Dio dio;
  final void Function()? onAuthFailure;

  AuthInterceptor({
    required this.strategy,
    required this.credentials,
    required this.dio,
    this.onAuthFailure,
  });

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    try {
      await strategy.applyToRequest(options, credentials);
      handler.next(options);
    } catch (e) {
      handler.reject(
        DioException(
          requestOptions: options,
          error: e,
        ),
      );
    }
  }

  @override
  Future<void> onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) async {
    if (err.response?.statusCode == 401) {
      bool refreshed = false;
      try {
        refreshed = await strategy.refresh(credentials);
      } catch (e) {
        refreshed = false;
      }

      if (refreshed) {
        try {
          // Clone the original request to retry
          final requestOptions = err.requestOptions;
          
          // Retry the request
          final response = await dio.fetch(requestOptions);
          return handler.resolve(response);
        } on DioException catch (e) {
          return handler.next(e);
        } catch (e) {
          return handler.next(
            DioException(
              requestOptions: err.requestOptions,
              error: e,
            ),
          );
        }
      } else {
        onAuthFailure?.call();
      }
    }
    handler.next(err);
  }
}
