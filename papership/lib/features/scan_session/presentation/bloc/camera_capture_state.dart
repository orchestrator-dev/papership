import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/error/app_failure.dart';
import '../../../../domain/models/scanned_page.dart';

part 'camera_capture_state.freezed.dart';

@freezed
abstract class CameraCaptureState with _$CameraCaptureState {
  const factory CameraCaptureState.idle() = _Idle;
  const factory CameraCaptureState.capturing() = _Capturing;
  const factory CameraCaptureState.success(ScannedPage page) = _Success;
  const factory CameraCaptureState.error(AppFailure failure) = _Error;
}
