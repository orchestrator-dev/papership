import 'package:freezed_annotation/freezed_annotation.dart';

part 'tag_dto.freezed.dart';
part 'tag_dto.g.dart';

@freezed
abstract class TagDto with _$TagDto {
  const factory TagDto({
    required int id,
    required String name,
    required String slug,
    required String color,
    @JsonKey(name: 'text_color') required String textColor,
    @JsonKey(name: 'match') required String match,
    @JsonKey(name: 'matching_algorithm') required int matchingAlgorithm,
    @JsonKey(name: 'is_insensitive') required bool isInsensitive,
    @JsonKey(name: 'is_inbox_tag') required bool isInboxTag,
  }) = _TagDto;

  factory TagDto.fromJson(Map<String, dynamic> json) => _$TagDtoFromJson(json);
}
