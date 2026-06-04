import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:paperless_companion/core/auth/models/auth_config.dart';
import 'package:paperless_companion/core/auth/models/auth_credentials.dart';
import 'package:paperless_companion/core/auth/strategies/oidc_auth_strategy.dart';

void main() {
  late OidcAuthStrategy strategy;

  setUp(() {
    strategy = OidcAuthStrategy();
  });

  group('OidcAuthStrategy', () {
    test('id is oidc', () {
      expect(strategy.id, 'oidc');
    });

    test('authenticate throws if issuer or client id missing', () async {
      final config = const AuthConfig(serverId: '1', baseUrl: 'http://localhost');
      expect(() => strategy.authenticate(config), throwsException);
    });

    test('applyToRequest adds Bearer token', () async {
      final options = RequestOptions(path: '/api');
      final credentials = const AuthCredentials(token: 'access_token_123');
      
      await strategy.applyToRequest(options, credentials);
      
      expect(options.headers['Authorization'], 'Bearer access_token_123');
    });

    test('refresh returns false if missing parameters', () async {
      final credentials = const AuthCredentials(token: 'old');
      final result = await strategy.refresh(credentials);
      expect(result, isFalse);
    });

    test('serialize and deserialize work correctly', () {
      final credentials = const AuthCredentials(
        token: 'access_token',
        refreshToken: 'refresh_token',
        oidcDiscoveryUrl: 'http://issuer',
        oidcClientId: 'client_id',
      );
      final data = strategy.serialize(credentials);
      
      expect(data['token'], 'access_token');
      expect(data['refreshToken'], 'refresh_token');
      expect(data['oidcDiscoveryUrl'], 'http://issuer');
      expect(data['oidcClientId'], 'client_id');
      
      final deserialized = strategy.deserialize(data);
      expect(deserialized.token, 'access_token');
      expect(deserialized.refreshToken, 'refresh_token');
      expect(deserialized.oidcDiscoveryUrl, 'http://issuer');
      expect(deserialized.oidcClientId, 'client_id');
    });
  });
}
