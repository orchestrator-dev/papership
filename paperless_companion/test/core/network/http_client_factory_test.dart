import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:paperless_companion/core/auth/auth_strategy.dart';
import 'package:paperless_companion/core/auth/server_config.dart';
import 'package:paperless_companion/core/network/http_client_factory.dart';

class MockAuthStrategy extends Mock implements AuthStrategy {}
class MockAuthCredentials extends Mock implements AuthCredentials {}

class _MockAdapter implements HttpClientAdapter {
  final Future<ResponseBody> Function(RequestOptions) handler;

  _MockAdapter(this.handler);

  @override
  Future<ResponseBody> fetch(
      RequestOptions options, Stream<Uint8List>? requestStream, Future<void>? cancelFuture) async {
    return handler(options);
  }

  @override
  void close({bool force = false}) {}
}

void main() {
  late MockAuthStrategy mockStrategy;
  late MockAuthCredentials mockCredentials;
  late PaperlessHttpClientFactory factory;

  setUp(() {
    mockStrategy = MockAuthStrategy();
    mockCredentials = MockAuthCredentials();
    factory = PaperlessHttpClientFactory(onAuthFailure: () {});

    registerFallbackValue(RequestOptions(path: ''));
    registerFallbackValue(mockCredentials);
  });

  test('AuthInterceptor injects header (calls applyToRequest)', () async {
    final config = ServerConfig(
      id: 'test',
      displayName: 'Test',
      baseUrl: 'http://test.lan',
      authType: AuthStrategyType.token,
    );

    when(() => mockStrategy.applyToRequest(any(), any())).thenAnswer((_) async {});

    final dio = factory.createClient(config, mockStrategy, mockCredentials);

    dio.httpClientAdapter = _MockAdapter((options) async {
      return ResponseBody.fromString('', 200);
    });

    await dio.get('/test');

    verify(() => mockStrategy.applyToRequest(any(), mockCredentials)).called(1);
  });

  test('Retry fires on 503', () async {
    final config = ServerConfig(
      id: 'test',
      displayName: 'Test',
      baseUrl: 'http://test.lan',
      authType: AuthStrategyType.token,
    );

    when(() => mockStrategy.applyToRequest(any(), any())).thenAnswer((_) async {});

    final dio = factory.createClient(config, mockStrategy, mockCredentials);

    int callCount = 0;
    dio.httpClientAdapter = _MockAdapter((options) async {
      callCount++;
      return ResponseBody.fromString('', 503);
    });

    try {
      await dio.get('/test');
    } catch (e) {
      // Expected to fail after retries
    }

    // 1 original + 3 retries = 4 calls
    expect(callCount, 4);
  });

  test('401 triggers refresh', () async {
    final config = ServerConfig(
      id: 'test',
      displayName: 'Test',
      baseUrl: 'http://test.lan',
      authType: AuthStrategyType.token,
    );

    when(() => mockStrategy.applyToRequest(any(), any())).thenAnswer((_) async {});
    when(() => mockStrategy.refresh(any())).thenAnswer((_) async => true);

    final dio = factory.createClient(config, mockStrategy, mockCredentials);

    int callCount = 0;
    dio.httpClientAdapter = _MockAdapter((options) async {
      callCount++;
      if (callCount == 1) {
        return ResponseBody.fromString('', 401);
      }
      return ResponseBody.fromString('', 200);
    });

    final response = await dio.get('/test');

    expect(response.statusCode, 200);
    verify(() => mockStrategy.refresh(mockCredentials)).called(1);
    // applyToRequest should be called twice (initial + retry)
    verify(() => mockStrategy.applyToRequest(any(), mockCredentials)).called(2);
  });
}
