import 'package:freezed_annotation/freezed_annotation.dart';

part 'document_filter.freezed.dart';
part 'document_filter.g.dart';

@freezed
abstract class DocumentFilter with _$DocumentFilter {
  const factory DocumentFilter({
    String? query,
    String? tagIds,
    int? correspondentId,
    int? documentTypeId,
    String? ordering,
    @Default(1) int page,
  }) = _DocumentFilter;

  factory DocumentFilter.fromJson(Map<String, dynamic> json) =>
      _$DocumentFilterFromJson(json);
}
