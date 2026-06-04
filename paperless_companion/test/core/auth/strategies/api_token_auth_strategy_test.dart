import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:paperless_companion/core/auth/models/auth_config.dart';
import 'package:paperless_companion/core/auth/models/auth_credentials.dart';
import 'package:paperless_companion/core/auth/strategies/api_token_auth_strategy.dart';

void main() {
  late ApiTokenAuthStrategy strategy;

  setUp(() {
    strategy = ApiTokenAuthStrategy();
  });

  group('ApiTokenAuthStrategy', () {
    test('authenticate validates token is present', () async {
      const config = AuthConfig(
        serverId: 'test_server',
        baseUrl: 'http://localhost',
        token: 'api_token_123',
      );

      final credentials = await strategy.authenticate(config);
      expect(credentials.token, 'api_token_123');
      expect(credentials.serverId, 'test_server');
    });

    test('authenticate throws if token missing', () async {
      const config = AuthConfig(
        serverId: 'test_server',
        baseUrl: 'http://localhost',
      );

      expect(() => strategy.authenticate(config), throwsException);
    });

    test('applyToRequest injects Authorization header', () async {
      final options = RequestOptions(path: '/path');
      const credentials = AuthCredentials(token: 'api_token_123');

      await strategy.applyToRequest(options, credentials);
      expect(options.headers['Authorization'], 'Token api_token_123');
    });

    test('refresh returns false', () async {
      const credentials = AuthCredentials(token: 'api_token_123');
      final result = await strategy.refresh(credentials);
      expect(result, isFalse);
    });
  });
}
