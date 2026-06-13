import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../data/remote/dto/tag_dto.dart';
import '../../../data/remote/dto/correspondent_dto.dart';
import '../../../data/remote/dto/document_type_dto.dart';

part 'upload_state.freezed.dart';

@freezed
class UploadState with _$UploadState {
  const factory UploadState.idle() = _Idle;
  const factory UploadState.loadingMetadata() = _LoadingMetadata;
  const factory UploadState.ready({
    @Default([]) List<TagDto> tags,
    @Default([]) List<CorrespondentDto> correspondents,
    @Default([]) List<DocumentTypeDto> documentTypes,
  }) = _Ready;
  const factory UploadState.uploading(double progress) = _Uploading;
  const factory UploadState.success(String taskId) = _Success;
  const factory UploadState.error(String message) = _Error;
}
