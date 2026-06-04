import 'package:freezed_annotation/freezed_annotation.dart';

part 'task_dto.freezed.dart';
part 'task_dto.g.dart';

@freezed
abstract class TaskDto with _$TaskDto {
  const factory TaskDto({
    required int id,
    @JsonKey(name: 'task_id') required String taskId,
    @JsonKey(name: 'task_file_name') required String taskFileName,
    @JsonKey(name: 'date_created') required String dateCreated,
    @JsonKey(name: 'date_done') required String dateDone,
    required String type,
    required String status,
    required String result,
    required String acknowledged,
    @JsonKey(name: 'related_document') required String? relatedDocument,
  }) = _TaskDto;

  factory TaskDto.fromJson(Map<String, dynamic> json) => _$TaskDtoFromJson(json);
}
