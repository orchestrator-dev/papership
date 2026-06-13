import 'dart:io';

import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:papership/core/error/app_failure.dart';
import 'package:papership/data/scanner/camera/camera_scan_service.dart';

void main() {
  late CameraScanService service;

  setUp(() {
    service = CameraScanService();
    TestWidgetsFlutterBinding.ensureInitialized();
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger.setMockMethodCallHandler(
      const MethodChannel('flutter.baseflow.com/permissions/methods'),
      (MethodCall methodCall) async {
        if (methodCall.method == 'requestPermissions') return {1: 1, 3: 1};
        if (methodCall.method == 'checkPermissionStatus') return 1;
        return null;
      },
    );
  });

  group('captureWithEdgeDetection', () {
    test('returns bytes when user takes a picture', () async {
      // Create a dummy file
      final tempDir = Directory.systemTemp.createTempSync();
      final tempFile = File('${tempDir.path}/test.jpg')..writeAsBytesSync([1, 2, 3]);

      TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger.setMockMethodCallHandler(
        const MethodChannel('cunning_document_scanner'),
        (MethodCall methodCall) async {
          if (methodCall.method == 'getPictures') {
            return [tempFile.path];
          }
          return null;
        },
      );

      final result = await service.captureWithEdgeDetection();

      expect(result.isRight(), isTrue);
      result.fold(
        (l) => fail('Should be right'),
        (r) => expect(r, [1, 2, 3]),
      );

      tempDir.deleteSync(recursive: true);
    });

    test('returns Left when user cancels', () async {
      TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger.setMockMethodCallHandler(
        const MethodChannel('cunning_document_scanner'),
        (MethodCall methodCall) async {
          if (methodCall.method == 'getPictures') {
            return null; // User cancelled
          }
          return null;
        },
      );

      final result = await service.captureWithEdgeDetection();

      expect(result.isLeft(), isTrue);
      result.fold(
        (l) => expect(l, const AppFailure.unknown(message: 'User cancelled scan')),
        (r) => fail('Should be left'),
      );
    });
  });
}
