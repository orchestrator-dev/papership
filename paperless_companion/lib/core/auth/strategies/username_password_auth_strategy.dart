import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:paperless_companion/core/auth/auth_strategy.dart';
import 'package:paperless_companion/core/auth/models/auth_config.dart';
import 'package:paperless_companion/core/auth/models/auth_credentials.dart';

class UsernamePasswordAuthStrategy implements AuthStrategy {
  final Dio dio;
  final FlutterSecureStorage secureStorage;

  UsernamePasswordAuthStrategy(
    this.dio, {
    this.secureStorage = const FlutterSecureStorage(),
  });

  @override
  String get id => 'username_password';

  @override
  String get displayName => 'Username and Password';

  @override
  Future<AuthCredentials> authenticate(AuthConfig config) async {
    final username = config.username;
    final password = config.password;
    if (username == null || password == null) {
      throw Exception('Username and password are required.');
    }

    try {
      final response = await dio.post('${config.baseUrl}/api/token/', data: {
        'username': username,
        'password': password,
      });

      final token = response.data['token'] as String;
      
      await secureStorage.write(
        key: 'auth_${config.serverId}_token',
        value: token,
      );

      return AuthCredentials(
        serverId: config.serverId,
        baseUrl: config.baseUrl,
        token: token,
        username: username,
        password: password,
      );
    } catch (e) {
      throw Exception('Authentication failed: $e');
    }
  }

  @override
  Future<void> applyToRequest(RequestOptions options, AuthCredentials credentials) async {
    if (credentials.token != null && credentials.token!.isNotEmpty) {
      options.headers['Authorization'] = 'Token ${credentials.token}';
    }
  }

  @override
  Future<bool> refresh(AuthCredentials credentials) async {
    if (credentials.username == null || credentials.password == null || credentials.baseUrl == null || credentials.serverId == null) {
      return false;
    }
    
    try {
      final response = await dio.post('${credentials.baseUrl}/api/token/', data: {
        'username': credentials.username,
        'password': credentials.password,
      });

      final newToken = response.data['token'] as String;
      
      await secureStorage.write(
        key: 'auth_${credentials.serverId}_token',
        value: newToken,
      );

      // Mutating the credentials passed might not work if it's freezed, but we update secureStorage so next deserialize gets it, 
      // or we return true and the caller handles updating credentials from strategy.
      return true;
    } catch (e) {
      return false;
    }
  }

  @override
  Map<String, String> serialize(AuthCredentials credentials) {
    return {
      'serverId': credentials.serverId ?? '',
      'baseUrl': credentials.baseUrl ?? '',
      'token': credentials.token ?? '',
      'username': credentials.username ?? '',
      'password': credentials.password ?? '',
    };
  }

  @override
  AuthCredentials deserialize(Map<String, String> data) {
    return AuthCredentials(
      serverId: data['serverId'],
      baseUrl: data['baseUrl'],
      token: data['token'],
      username: data['username'],
      password: data['password'],
    );
  }
}
