import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:paperless_companion/core/auth/models/auth_config.dart';
import 'package:paperless_companion/core/auth/models/auth_credentials.dart';
import 'package:paperless_companion/core/auth/strategies/username_password_auth_strategy.dart';

class MockDio extends Mock implements Dio {}
class MockFlutterSecureStorage extends Mock implements FlutterSecureStorage {}

void main() {
  late MockDio mockDio;
  late MockFlutterSecureStorage mockSecureStorage;
  late UsernamePasswordAuthStrategy strategy;

  setUp(() {
    mockDio = MockDio();
    mockSecureStorage = MockFlutterSecureStorage();
    strategy = UsernamePasswordAuthStrategy(
      mockDio,
      secureStorage: mockSecureStorage,
    );
    
    when(() => mockSecureStorage.write(key: any(named: 'key'), value: any(named: 'value')))
        .thenAnswer((_) async {});
  });

  group('UsernamePasswordAuthStrategy', () {
    test('authenticate success', () async {
      const config = AuthConfig(
        serverId: 'test_server',
        baseUrl: 'http://localhost',
        username: 'testuser',
        password: 'password123',
      );

      when(() => mockDio.post(any(), data: any(named: 'data')))
          .thenAnswer((_) async => Response(
                data: {'token': 'test_token_123'},
                requestOptions: RequestOptions(path: ''),
              ));

      final credentials = await strategy.authenticate(config);

      expect(credentials.token, 'test_token_123');
      expect(credentials.username, 'testuser');
      expect(credentials.password, 'password123');

      verify(() => mockDio.post('http://localhost/api/token/', data: {
            'username': 'testuser',
            'password': 'password123',
          })).called(1);

      verify(() => mockSecureStorage.write(
            key: 'auth_test_server_token',
            value: 'test_token_123',
          )).called(1);
    });

    test('authenticate throws if missing username or password', () async {
      const config = AuthConfig(
        serverId: 'test_server',
        baseUrl: 'http://localhost',
      );

      expect(() => strategy.authenticate(config), throwsException);
    });

    test('applyToRequest injects Authorization header', () async {
      final options = RequestOptions(path: '/some/path');
      const credentials = AuthCredentials(token: 'test_token');

      await strategy.applyToRequest(options, credentials);

      expect(options.headers['Authorization'], 'Token test_token');
    });

    test('refresh success', () async {
      const credentials = AuthCredentials(
        serverId: 'test_server',
        baseUrl: 'http://localhost',
        username: 'testuser',
        password: 'password123',
      );

      when(() => mockDio.post(any(), data: any(named: 'data')))
          .thenAnswer((_) async => Response(
                data: {'token': 'new_token_456'},
                requestOptions: RequestOptions(path: ''),
              ));

      final result = await strategy.refresh(credentials);

      expect(result, isTrue);

      verify(() => mockDio.post('http://localhost/api/token/', data: {
            'username': 'testuser',
            'password': 'password123',
          })).called(1);

      verify(() => mockSecureStorage.write(
            key: 'auth_test_server_token',
            value: 'new_token_456',
          )).called(1);
    });
  });
}
