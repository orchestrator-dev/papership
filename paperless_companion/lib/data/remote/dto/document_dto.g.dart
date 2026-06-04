// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'document_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_DocumentDto _$DocumentDtoFromJson(Map<String, dynamic> json) => _DocumentDto(
  id: (json['id'] as num).toInt(),
  title: json['title'] as String,
  content: json['content'] as String?,
  tags: (json['tags'] as List<dynamic>).map((e) => (e as num).toInt()).toList(),
  correspondent: (json['correspondent'] as num?)?.toInt(),
  documentType: (json['document_type'] as num?)?.toInt(),
  storagePath: json['storage_path'] as String?,
  created: json['created'] as String,
  added: json['added'] as String,
  modified: json['modified'] as String,
  asn: json['asn'] as String?,
  pageCount: (json['page_count'] as num?)?.toInt(),
  originalFileName: json['original_file_name'] as String,
  archivedFileName: json['archived_file_name'] as String,
);

Map<String, dynamic> _$DocumentDtoToJson(_DocumentDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'content': instance.content,
      'tags': instance.tags,
      'correspondent': instance.correspondent,
      'document_type': instance.documentType,
      'storage_path': instance.storagePath,
      'created': instance.created,
      'added': instance.added,
      'modified': instance.modified,
      'asn': instance.asn,
      'page_count': instance.pageCount,
      'original_file_name': instance.originalFileName,
      'archived_file_name': instance.archivedFileName,
    };

_DocumentUpdateDto _$DocumentUpdateDtoFromJson(Map<String, dynamic> json) =>
    _DocumentUpdateDto(
      title: json['title'] as String?,
      content: json['content'] as String?,
      tags: (json['tags'] as List<dynamic>?)
          ?.map((e) => (e as num).toInt())
          .toList(),
      correspondent: (json['correspondent'] as num?)?.toInt(),
      documentType: (json['document_type'] as num?)?.toInt(),
      storagePath: (json['storage_path'] as num?)?.toInt(),
      created: json['created'] as String?,
      asn: json['asn'] as String?,
    );

Map<String, dynamic> _$DocumentUpdateDtoToJson(_DocumentUpdateDto instance) =>
    <String, dynamic>{
      'title': instance.title,
      'content': instance.content,
      'tags': instance.tags,
      'correspondent': instance.correspondent,
      'document_type': instance.documentType,
      'storage_path': instance.storagePath,
      'created': instance.created,
      'asn': instance.asn,
    };
