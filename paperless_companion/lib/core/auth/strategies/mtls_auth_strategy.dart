import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';

import '../auth_strategy.dart';

class MtlsAuthStrategy implements AuthStrategy {
  @override
  String get id => 'mtls';

  @override
  String get displayName => 'Mutual TLS (mTLS)';

  @override
  Future<AuthCredentials> authenticate(AuthConfig config) async {
    String? certPath = config.clientCertPath;

    if (certPath == null) {
      final result = await FilePicker.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['p12', 'pfx', 'pem'],
      );
      if (result != null && result.files.single.path != null) {
        certPath = result.files.single.path;
      } else {
        throw Exception('No client certificate selected.');
      }
    }

    final file = File(certPath!);
    if (!await file.exists()) {
      throw Exception('Certificate file not found at path: $certPath');
    }

    final bytes = await file.readAsBytes();
    final base64Cert = base64Encode(bytes);

    return AuthCredentials(
      serverId: config.serverId,
      baseUrl: config.baseUrl,
      certificateBase64: base64Cert,
      password: config.clientCertPassword,
    );
  }

  @override
  Future<void> applyToRequest(RequestOptions options, AuthCredentials credentials) async {
    // TLS is handled at the client level (SecurityContext), not per-request headers.
  }

  @override
  Future<bool> refresh(AuthCredentials credentials) async {
    // Certificates don't refresh like tokens, return true.
    return true;
  }

  @override
  Map<String, String> serialize(AuthCredentials credentials) {
    return {
      if (credentials.certificateBase64 != null) 'certificateBase64': credentials.certificateBase64!,
      if (credentials.password != null) 'password': credentials.password!,
    };
  }

  @override
  AuthCredentials deserialize(Map<String, String> data) {
    return AuthCredentials(
      certificateBase64: data['certificateBase64'],
      password: data['password'],
    );
  }
}
