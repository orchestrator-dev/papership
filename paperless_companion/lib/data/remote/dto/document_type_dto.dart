import 'package:freezed_annotation/freezed_annotation.dart';

part 'document_type_dto.freezed.dart';
part 'document_type_dto.g.dart';

@freezed
abstract class DocumentTypeDto with _$DocumentTypeDto {
  const factory DocumentTypeDto({
    required int id,
    required String name,
    required String slug,
    required String match,
    @JsonKey(name: 'matching_algorithm') required int matchingAlgorithm,
    @JsonKey(name: 'is_insensitive') required bool isInsensitive,
  }) = _DocumentTypeDto;

  factory DocumentTypeDto.fromJson(Map<String, dynamic> json) => _$DocumentTypeDtoFromJson(json);
}
