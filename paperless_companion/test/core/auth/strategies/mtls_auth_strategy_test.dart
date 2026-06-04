import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:paperless_companion/core/auth/models/auth_config.dart';
import 'package:paperless_companion/core/auth/models/auth_credentials.dart';
import 'package:paperless_companion/core/auth/strategies/mtls_auth_strategy.dart';

void main() {
  late MtlsAuthStrategy strategy;

  setUp(() {
    strategy = MtlsAuthStrategy();
  });

  group('MtlsAuthStrategy', () {
    test('id is mtls', () {
      expect(strategy.id, 'mtls');
    });

    test('authenticate throws if file does not exist', () async {
      final config = const AuthConfig(
        serverId: '1', 
        baseUrl: 'http://localhost',
        clientCertPath: '/does/not/exist.p12',
      );
      expect(() => strategy.authenticate(config), throwsException);
    });

    test('authenticate reads file and returns base64 cert', () async {
      final tempFile = File('test_cert.p12');
      await tempFile.writeAsBytes([1, 2, 3]);

      final config = const AuthConfig(
        serverId: '1', 
        baseUrl: 'http://localhost',
        clientCertPath: 'test_cert.p12',
        clientCertPassword: 'pass',
      );
      
      final credentials = await strategy.authenticate(config);
      
      expect(credentials.certificateBase64, base64Encode([1, 2, 3]));
      expect(credentials.password, 'pass');

      await tempFile.delete();
    });

    test('applyToRequest does nothing', () async {
      final options = RequestOptions(path: '/api');
      final credentials = const AuthCredentials(certificateBase64: 'abc');
      
      await strategy.applyToRequest(options, credentials);
      
      expect(options.headers, isEmpty);
    });

    test('refresh returns true', () async {
      final result = await strategy.refresh(const AuthCredentials());
      expect(result, isTrue);
    });

    test('serialize and deserialize work correctly', () {
      final credentials = const AuthCredentials(
        certificateBase64: 'abc',
        password: 'pass',
      );
      final data = strategy.serialize(credentials);
      
      expect(data['certificateBase64'], 'abc');
      expect(data['password'], 'pass');
      
      final deserialized = strategy.deserialize(data);
      expect(deserialized.certificateBase64, 'abc');
      expect(deserialized.password, 'pass');
    });
  });
}
