import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_failure.freezed.dart';

enum ScannerErrorCode {
  busy,
  unreachable,
  unsupported,
  unknown,
}

@freezed
sealed class AppFailure with _$AppFailure {
  const factory AppFailure.network({required String message, int? statusCode}) = NetworkFailure;
  const factory AppFailure.auth({required String message}) = AuthFailure;
  const factory AppFailure.scanner({required String message, ScannerErrorCode? code}) = ScannerFailure;
  const factory AppFailure.parse({required String message}) = ParseFailure;
  const factory AppFailure.unknown({required String message}) = UnknownFailure;
}
