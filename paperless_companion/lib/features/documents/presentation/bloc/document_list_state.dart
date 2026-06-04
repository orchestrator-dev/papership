import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../data/remote/dto/document_dto.dart';
import '../../../../domain/models/document.dart';
import '../../../../domain/models/document_filter.dart';

part 'document_list_state.freezed.dart';
part 'document_list_state.g.dart';

@freezed
abstract class DocumentListState with _$DocumentListState {
  const factory DocumentListState.initial() = _Initial;

  const factory DocumentListState.loading({
    @Default([]) List<Document> documents,
    required DocumentFilter filter,
  }) = _Loading;

  const factory DocumentListState.loaded({
    required List<Document> documents,
    required DocumentFilter filter,
    required bool hasMore,
  }) = _Loaded;

  const factory DocumentListState.error({
    required String message,
    required DocumentFilter filter,
    @Default([]) List<Document> documents,
  }) = _Error;

  factory DocumentListState.fromJson(Map<String, dynamic> json) =>
      _$DocumentListStateFromJson(json);
}
