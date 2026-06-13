import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:papership/domain/models/scanned_page.dart';
import 'package:papership/features/scan_session/presentation/bloc/camera_capture_cubit.dart';
import 'package:papership/features/scan_session/presentation/bloc/camera_capture_state.dart';
import 'package:papership/features/scan_session/presentation/screens/camera_capture_screen.dart';
import 'package:papership/injection_container.dart';
import 'package:bloc_test/bloc_test.dart';

class MockCameraCaptureCubit extends MockCubit<CameraCaptureState> implements CameraCaptureCubit {}

void main() {
  late MockCameraCaptureCubit mockCubit;
  final validPngBytes = base64Decode('iVBORw0KGgoAAAANSUhEUgAAAAEAAAABCAQAAAC1HAwCAAAAC0lEQVR42mNkYAAAAAYAAjCB0C8AAAAASUVORK5CYII=');

  setUp(() {
    mockCubit = MockCameraCaptureCubit();
    when(() => mockCubit.captureWithEdgeDetection()).thenAnswer((_) async {});
    
    if (sl.isRegistered<CameraCaptureCubit>()) {
      sl.unregister<CameraCaptureCubit>();
    }
    sl.registerFactory<CameraCaptureCubit>(() => mockCubit);
  });

  tearDown(() {
    sl.reset();
  });

  testWidgets('shows loading state and triggers capture on init', (tester) async {
    when(() => mockCubit.state).thenReturn(const CameraCaptureState.idle());

    await tester.pumpWidget(
      const MaterialApp(
        home: CameraCaptureScreen(),
      ),
    );

    verify(() => mockCubit.captureWithEdgeDetection()).called(1);
    expect(find.byType(CircularProgressIndicator), findsOneWidget);
  });

  testWidgets('retake flow works', (tester) async {
    final page = ScannedPage(
      id: 'test_id',
      source: ScannedPageSource.camera,
      imageBytes: validPngBytes,
    );

    when(() => mockCubit.state).thenReturn(CameraCaptureState.success(page));

    await tester.pumpWidget(
      const MaterialApp(
        home: CameraCaptureScreen(),
      ),
    );

    expect(find.text('Retake'), findsOneWidget);
    expect(find.text('Use this page'), findsOneWidget);

    await tester.tap(find.text('Retake'));
    await tester.pump();

    verify(() => mockCubit.captureWithEdgeDetection()).called(2); // 1 for init, 1 for retake
  });
}
