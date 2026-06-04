// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'document_filter.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_DocumentFilter _$DocumentFilterFromJson(Map<String, dynamic> json) =>
    _DocumentFilter(
      query: json['query'] as String?,
      tagIds: json['tagIds'] as String?,
      correspondentId: (json['correspondentId'] as num?)?.toInt(),
      documentTypeId: (json['documentTypeId'] as num?)?.toInt(),
      ordering: json['ordering'] as String?,
      page: (json['page'] as num?)?.toInt() ?? 1,
    );

Map<String, dynamic> _$DocumentFilterToJson(_DocumentFilter instance) =>
    <String, dynamic>{
      'query': instance.query,
      'tagIds': instance.tagIds,
      'correspondentId': instance.correspondentId,
      'documentTypeId': instance.documentTypeId,
      'ordering': instance.ordering,
      'page': instance.page,
    };
