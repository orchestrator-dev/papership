// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pending_upload.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UploadMetadata _$UploadMetadataFromJson(Map<String, dynamic> json) =>
    _UploadMetadata(
      title: json['title'] as String?,
      tags: (json['tags'] as List<dynamic>?)
          ?.map((e) => (e as num).toInt())
          .toList(),
      correspondentId: (json['correspondentId'] as num?)?.toInt(),
      documentTypeId: (json['documentTypeId'] as num?)?.toInt(),
      createdDate: json['createdDate'] as String?,
      asn: json['asn'] as String?,
    );

Map<String, dynamic> _$UploadMetadataToJson(_UploadMetadata instance) =>
    <String, dynamic>{
      'title': instance.title,
      'tags': instance.tags,
      'correspondentId': instance.correspondentId,
      'documentTypeId': instance.documentTypeId,
      'createdDate': instance.createdDate,
      'asn': instance.asn,
    };

_PendingUpload _$PendingUploadFromJson(Map<String, dynamic> json) =>
    _PendingUpload(
      id: json['id'] as String,
      pdfPath: json['pdfPath'] as String,
      metadata: UploadMetadata.fromJson(
        json['metadata'] as Map<String, dynamic>,
      ),
      createdAt: DateTime.parse(json['createdAt'] as String),
      retryCount: (json['retryCount'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$PendingUploadToJson(_PendingUpload instance) =>
    <String, dynamic>{
      'id': instance.id,
      'pdfPath': instance.pdfPath,
      'metadata': instance.metadata,
      'createdAt': instance.createdAt.toIso8601String(),
      'retryCount': instance.retryCount,
    };
