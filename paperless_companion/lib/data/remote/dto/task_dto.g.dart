// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TaskDto _$TaskDtoFromJson(Map<String, dynamic> json) => _TaskDto(
  id: (json['id'] as num).toInt(),
  taskId: json['task_id'] as String,
  taskFileName: json['task_file_name'] as String,
  dateCreated: json['date_created'] as String,
  dateDone: json['date_done'] as String,
  type: json['type'] as String,
  status: json['status'] as String,
  result: json['result'] as String,
  acknowledged: json['acknowledged'] as String,
  relatedDocument: json['related_document'] as String?,
);

Map<String, dynamic> _$TaskDtoToJson(_TaskDto instance) => <String, dynamic>{
  'id': instance.id,
  'task_id': instance.taskId,
  'task_file_name': instance.taskFileName,
  'date_created': instance.dateCreated,
  'date_done': instance.dateDone,
  'type': instance.type,
  'status': instance.status,
  'result': instance.result,
  'acknowledged': instance.acknowledged,
  'related_document': instance.relatedDocument,
};
