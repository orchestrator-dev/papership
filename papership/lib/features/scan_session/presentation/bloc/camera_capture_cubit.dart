import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:uuid/uuid.dart';

import '../../../../data/scanner/camera/camera_scan_service.dart';
import '../../../../domain/models/scanned_page.dart';
import 'camera_capture_state.dart';

@injectable
class CameraCaptureCubit extends Cubit<CameraCaptureState> {
  final CameraScanService _cameraScanService;
  final Uuid _uuid = const Uuid();

  CameraCaptureCubit(this._cameraScanService)
      : super(const CameraCaptureState.idle());

  Future<void> captureWithEdgeDetection() async {
    emit(const CameraCaptureState.capturing());
    final result = await _cameraScanService.captureWithEdgeDetection();
    result.fold(
      (failure) => emit(CameraCaptureState.error(failure)),
      (bytes) {
        final page = ScannedPage(
          id: _uuid.v4(),
          source: ScannedPageSource.camera,
          imageBytes: bytes,
        );
        emit(CameraCaptureState.success(page));
      },
    );
  }

  Future<void> captureRaw() async {
    emit(const CameraCaptureState.capturing());
    final result = await _cameraScanService.captureRaw();
    result.fold(
      (failure) => emit(CameraCaptureState.error(failure)),
      (bytes) {
        final page = ScannedPage(
          id: _uuid.v4(),
          source: ScannedPageSource.camera,
          imageBytes: bytes,
        );
        emit(CameraCaptureState.success(page));
      },
    );
  }

  void reset() {
    emit(const CameraCaptureState.idle());
  }
}
