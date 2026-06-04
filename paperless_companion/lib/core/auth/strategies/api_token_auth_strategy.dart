import 'package:dio/dio.dart';
import 'package:paperless_companion/core/auth/auth_strategy.dart';

class ApiTokenAuthStrategy implements AuthStrategy {
  @override
  String get id => 'api_token';

  @override
  String get displayName => 'API Token';

  @override
  Future<AuthCredentials> authenticate(AuthConfig config) async {
    final token = config.token;
    if (token == null || token.isEmpty) {
      throw Exception('Token is required.');
    }

    // No network call needed, just validate token is non-empty
    return AuthCredentials(
      serverId: config.serverId,
      baseUrl: config.baseUrl,
      token: token,
    );
  }

  @override
  Future<void> applyToRequest(RequestOptions options, AuthCredentials credentials) async {
    if (credentials.token != null && credentials.token!.isNotEmpty) {
      options.headers['Authorization'] = 'Token ${credentials.token}';
    }
  }

  @override
  Future<bool> refresh(AuthCredentials credentials) async {
    // No refresh possible, force re-login
    return false;
  }

  @override
  Map<String, String> serialize(AuthCredentials credentials) {
    return {
      'serverId': credentials.serverId ?? '',
      'baseUrl': credentials.baseUrl ?? '',
      'token': credentials.token ?? '',
    };
  }

  @override
  AuthCredentials deserialize(Map<String, String> data) {
    return AuthCredentials(
      serverId: data['serverId'],
      baseUrl: data['baseUrl'],
      token: data['token'],
    );
  }
}
