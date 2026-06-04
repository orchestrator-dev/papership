// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'correspondent_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CorrespondentDto _$CorrespondentDtoFromJson(Map<String, dynamic> json) =>
    _CorrespondentDto(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      slug: json['slug'] as String,
      match: json['match'] as String,
      matchingAlgorithm: (json['matching_algorithm'] as num).toInt(),
      isInsensitive: json['is_insensitive'] as bool,
      lastCorrespondence: json['last_correspondence'] as String?,
    );

Map<String, dynamic> _$CorrespondentDtoToJson(_CorrespondentDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'slug': instance.slug,
      'match': instance.match,
      'matching_algorithm': instance.matchingAlgorithm,
      'is_insensitive': instance.isInsensitive,
      'last_correspondence': instance.lastCorrespondence,
    };
