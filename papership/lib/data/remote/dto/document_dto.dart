import 'package:freezed_annotation/freezed_annotation.dart';

part 'document_dto.freezed.dart';
part 'document_dto.g.dart';

@freezed
abstract class DocumentDto with _$DocumentDto {
  const factory DocumentDto({
    required int id,
    required String title,
    required String? content,
    required List<int> tags,
    required int? correspondent,
    @JsonKey(name: 'document_type') required int? documentType,
    @JsonKey(name: 'storage_path') required String? storagePath,
    required String created,
    required String added,
    required String modified,
    required String? asn,
    @JsonKey(name: 'page_count') required int? pageCount,
    @JsonKey(name: 'original_file_name') required String originalFileName,
    @JsonKey(name: 'archived_file_name') required String archivedFileName,
  }) = _DocumentDto;

  factory DocumentDto.fromJson(Map<String, dynamic> json) => _$DocumentDtoFromJson(json);
}

@freezed
abstract class DocumentUpdateDto with _$DocumentUpdateDto {
  const factory DocumentUpdateDto({
    String? title,
    String? content,
    List<int>? tags,
    int? correspondent,
    @JsonKey(name: 'document_type') int? documentType,
    @JsonKey(name: 'storage_path') int? storagePath,
    String? created,
    String? asn,
  }) = _DocumentUpdateDto;

  factory DocumentUpdateDto.fromJson(Map<String, dynamic> json) => _$DocumentUpdateDtoFromJson(json);
}
