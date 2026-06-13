// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'storage_path_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_StoragePathDto _$StoragePathDtoFromJson(Map<String, dynamic> json) =>
    _StoragePathDto(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      slug: json['slug'] as String,
      path: json['path'] as String,
      match: json['match'] as String,
      matchingAlgorithm: (json['matching_algorithm'] as num).toInt(),
      isInsensitive: json['is_insensitive'] as bool,
    );

Map<String, dynamic> _$StoragePathDtoToJson(_StoragePathDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'slug': instance.slug,
      'path': instance.path,
      'match': instance.match,
      'matching_algorithm': instance.matchingAlgorithm,
      'is_insensitive': instance.isInsensitive,
    };
