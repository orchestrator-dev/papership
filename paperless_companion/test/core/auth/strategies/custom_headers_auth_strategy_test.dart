import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:paperless_companion/core/auth/models/auth_config.dart';
import 'package:paperless_companion/core/auth/models/auth_credentials.dart';
import 'package:paperless_companion/core/auth/strategies/custom_headers_auth_strategy.dart';

void main() {
  late CustomHeadersAuthStrategy strategy;

  setUp(() {
    strategy = CustomHeadersAuthStrategy();
  });

  group('CustomHeadersAuthStrategy', () {
    test('id is custom', () {
      expect(strategy.id, 'custom');
    });

    test('authenticate throws if headers are null or empty', () async {
      final configNull = const AuthConfig(serverId: '1', baseUrl: 'http://localhost');
      expect(() => strategy.authenticate(configNull), throwsException);

      final configEmpty = const AuthConfig(serverId: '1', baseUrl: 'http://localhost', customHeaders: {});
      expect(() => strategy.authenticate(configEmpty), throwsException);
    });

    test('authenticate returns credentials with headers', () async {
      final config = const AuthConfig(
        serverId: '1',
        baseUrl: 'http://localhost',
        customHeaders: {'X-Custom-Header': 'value123'},
      );
      final credentials = await strategy.authenticate(config);
      
      expect(credentials.customHeaders, {'X-Custom-Header': 'value123'});
    });

    test('applyToRequest adds headers', () async {
      final options = RequestOptions(path: '/api');
      final credentials = const AuthCredentials(customHeaders: {'X-Auth': 'secret'});
      
      await strategy.applyToRequest(options, credentials);
      
      expect(options.headers['X-Auth'], 'secret');
    });

    test('refresh always returns true', () async {
      final result = await strategy.refresh(const AuthCredentials());
      expect(result, isTrue);
    });

    test('serialize and deserialize work correctly', () {
      final credentials = const AuthCredentials(customHeaders: {'X-Auth': 'secret'});
      final data = strategy.serialize(credentials);
      
      expect(data.containsKey('customHeaders'), isTrue);
      
      final deserialized = strategy.deserialize(data);
      expect(deserialized.customHeaders, {'X-Auth': 'secret'});
    });
  });
}
