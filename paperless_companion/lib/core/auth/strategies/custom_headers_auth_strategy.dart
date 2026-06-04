import 'dart:convert';
import 'package:dio/dio.dart';

import '../auth_strategy.dart';

class CustomHeadersAuthStrategy implements AuthStrategy {
  @override
  String get id => 'custom';

  @override
  String get displayName => 'Custom Headers';

  @override
  Future<AuthCredentials> authenticate(AuthConfig config) async {
    final headers = config.customHeaders;
    if (headers == null || headers.isEmpty) {
      throw Exception('Custom headers map cannot be empty.');
    }
    return AuthCredentials(
      serverId: config.serverId,
      baseUrl: config.baseUrl,
      customHeaders: headers,
    );
  }

  @override
  Future<void> applyToRequest(RequestOptions options, AuthCredentials credentials) async {
    final headers = credentials.customHeaders;
    if (headers != null && headers.isNotEmpty) {
      options.headers.addAll(headers);
    }
  }

  @override
  Future<bool> refresh(AuthCredentials credentials) async {
    // Stateless authentication, so refreshing always "succeeds" or rather doesn't fail due to expiry
    return true;
  }

  @override
  Map<String, String> serialize(AuthCredentials credentials) {
    return {
      if (credentials.customHeaders != null)
        'customHeaders': jsonEncode(credentials.customHeaders),
    };
  }

  @override
  AuthCredentials deserialize(Map<String, String> data) {
    Map<String, String>? headers;
    if (data.containsKey('customHeaders')) {
      final decoded = jsonDecode(data['customHeaders']!) as Map<String, dynamic>;
      headers = decoded.map((key, value) => MapEntry(key, value.toString()));
    }
    return AuthCredentials(
      customHeaders: headers,
    );
  }
}
