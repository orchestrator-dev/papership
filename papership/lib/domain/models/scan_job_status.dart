import 'package:freezed_annotation/freezed_annotation.dart';

part 'scan_job_status.freezed.dart';

enum ScanJobState {
  pending,
  processing,
  canceled,
  completed,
  aborted,
  unknown
}

@freezed
sealed class ScanJobStatus with _$ScanJobStatus {
  const factory ScanJobStatus({
    required ScanJobState state,
    int? age,
  }) = _ScanJobStatus;
}
