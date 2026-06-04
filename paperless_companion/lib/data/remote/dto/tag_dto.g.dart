// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tag_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TagDto _$TagDtoFromJson(Map<String, dynamic> json) => _TagDto(
  id: (json['id'] as num).toInt(),
  name: json['name'] as String,
  slug: json['slug'] as String,
  color: json['color'] as String,
  textColor: json['text_color'] as String,
  match: json['match'] as String,
  matchingAlgorithm: (json['matching_algorithm'] as num).toInt(),
  isInsensitive: json['is_insensitive'] as bool,
  isInboxTag: json['is_inbox_tag'] as bool,
);

Map<String, dynamic> _$TagDtoToJson(_TagDto instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'slug': instance.slug,
  'color': instance.color,
  'text_color': instance.textColor,
  'match': instance.match,
  'matching_algorithm': instance.matchingAlgorithm,
  'is_insensitive': instance.isInsensitive,
  'is_inbox_tag': instance.isInboxTag,
};
