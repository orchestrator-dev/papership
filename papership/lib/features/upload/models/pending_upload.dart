import 'package:freezed_annotation/freezed_annotation.dart';

part 'pending_upload.freezed.dart';
part 'pending_upload.g.dart';

@freezed
abstract class UploadMetadata with _$UploadMetadata {
  const factory UploadMetadata({
    String? title,
    List<int>? tags,
    int? correspondentId,
    int? documentTypeId,
    String? createdDate,
    String? asn,
  }) = _UploadMetadata;

  factory UploadMetadata.fromJson(Map<String, dynamic> json) =>
      _$UploadMetadataFromJson(json);
}

@freezed
abstract class PendingUpload with _$PendingUpload {
  const factory PendingUpload({
    required String id,
    required String pdfPath,
    required UploadMetadata metadata,
    required DateTime createdAt,
    @Default(0) int retryCount,
  }) = _PendingUpload;

  factory PendingUpload.fromJson(Map<String, dynamic> json) =>
      _$PendingUploadFromJson(json);
}
