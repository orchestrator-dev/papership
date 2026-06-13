// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'document_type_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_DocumentTypeDto _$DocumentTypeDtoFromJson(Map<String, dynamic> json) =>
    _DocumentTypeDto(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      slug: json['slug'] as String,
      match: json['match'] as String,
      matchingAlgorithm: (json['matching_algorithm'] as num).toInt(),
      isInsensitive: json['is_insensitive'] as bool,
    );

Map<String, dynamic> _$DocumentTypeDtoToJson(_DocumentTypeDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'slug': instance.slug,
      'match': instance.match,
      'matching_algorithm': instance.matchingAlgorithm,
      'is_insensitive': instance.isInsensitive,
    };
