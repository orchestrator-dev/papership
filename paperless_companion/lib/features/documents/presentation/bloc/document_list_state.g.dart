// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'document_list_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Initial _$InitialFromJson(Map<String, dynamic> json) =>
    _Initial($type: json['runtimeType'] as String?);

Map<String, dynamic> _$InitialToJson(_Initial instance) => <String, dynamic>{
  'runtimeType': instance.$type,
};

_Loading _$LoadingFromJson(Map<String, dynamic> json) => _Loading(
  documents:
      (json['documents'] as List<dynamic>?)
          ?.map((e) => DocumentDto.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  filter: DocumentFilter.fromJson(json['filter'] as Map<String, dynamic>),
  $type: json['runtimeType'] as String?,
);

Map<String, dynamic> _$LoadingToJson(_Loading instance) => <String, dynamic>{
  'documents': instance.documents,
  'filter': instance.filter,
  'runtimeType': instance.$type,
};

_Loaded _$LoadedFromJson(Map<String, dynamic> json) => _Loaded(
  documents: (json['documents'] as List<dynamic>)
      .map((e) => DocumentDto.fromJson(e as Map<String, dynamic>))
      .toList(),
  filter: DocumentFilter.fromJson(json['filter'] as Map<String, dynamic>),
  hasMore: json['hasMore'] as bool,
  $type: json['runtimeType'] as String?,
);

Map<String, dynamic> _$LoadedToJson(_Loaded instance) => <String, dynamic>{
  'documents': instance.documents,
  'filter': instance.filter,
  'hasMore': instance.hasMore,
  'runtimeType': instance.$type,
};

_Error _$ErrorFromJson(Map<String, dynamic> json) => _Error(
  message: json['message'] as String,
  filter: DocumentFilter.fromJson(json['filter'] as Map<String, dynamic>),
  documents:
      (json['documents'] as List<dynamic>?)
          ?.map((e) => DocumentDto.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  $type: json['runtimeType'] as String?,
);

Map<String, dynamic> _$ErrorToJson(_Error instance) => <String, dynamic>{
  'message': instance.message,
  'filter': instance.filter,
  'documents': instance.documents,
  'runtimeType': instance.$type,
};
