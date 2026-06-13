import 'dart:typed_data';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../domain/models/document.dart';
import '../../../../data/remote/dto/document_dto.dart';

part 'document_detail_state.freezed.dart';

@freezed
class DocumentDetailState with _$DocumentDetailState {
  const factory DocumentDetailState.loading() = _Loading;
  const factory DocumentDetailState.loaded({
    required Document document,
    Uint8List? previewBytes,
  }) = _Loaded;
  const factory DocumentDetailState.editing({
    required Document document,
  }) = _Editing;
  const factory DocumentDetailState.saving({
    required Document document,
  }) = _Saving;
  const factory DocumentDetailState.error(String message) = _Error;
}
