// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'task_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TaskDto {

 int get id;@JsonKey(name: 'task_id') String get taskId;@JsonKey(name: 'task_file_name') String get taskFileName;@JsonKey(name: 'date_created') String get dateCreated;@JsonKey(name: 'date_done') String get dateDone; String get type; String get status; String get result; String get acknowledged;@JsonKey(name: 'related_document') String? get relatedDocument;
/// Create a copy of TaskDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TaskDtoCopyWith<TaskDto> get copyWith => _$TaskDtoCopyWithImpl<TaskDto>(this as TaskDto, _$identity);

  /// Serializes this TaskDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TaskDto&&(identical(other.id, id) || other.id == id)&&(identical(other.taskId, taskId) || other.taskId == taskId)&&(identical(other.taskFileName, taskFileName) || other.taskFileName == taskFileName)&&(identical(other.dateCreated, dateCreated) || other.dateCreated == dateCreated)&&(identical(other.dateDone, dateDone) || other.dateDone == dateDone)&&(identical(other.type, type) || other.type == type)&&(identical(other.status, status) || other.status == status)&&(identical(other.result, result) || other.result == result)&&(identical(other.acknowledged, acknowledged) || other.acknowledged == acknowledged)&&(identical(other.relatedDocument, relatedDocument) || other.relatedDocument == relatedDocument));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,taskId,taskFileName,dateCreated,dateDone,type,status,result,acknowledged,relatedDocument);

@override
String toString() {
  return 'TaskDto(id: $id, taskId: $taskId, taskFileName: $taskFileName, dateCreated: $dateCreated, dateDone: $dateDone, type: $type, status: $status, result: $result, acknowledged: $acknowledged, relatedDocument: $relatedDocument)';
}


}

/// @nodoc
abstract mixin class $TaskDtoCopyWith<$Res>  {
  factory $TaskDtoCopyWith(TaskDto value, $Res Function(TaskDto) _then) = _$TaskDtoCopyWithImpl;
@useResult
$Res call({
 int id,@JsonKey(name: 'task_id') String taskId,@JsonKey(name: 'task_file_name') String taskFileName,@JsonKey(name: 'date_created') String dateCreated,@JsonKey(name: 'date_done') String dateDone, String type, String status, String result, String acknowledged,@JsonKey(name: 'related_document') String? relatedDocument
});




}
/// @nodoc
class _$TaskDtoCopyWithImpl<$Res>
    implements $TaskDtoCopyWith<$Res> {
  _$TaskDtoCopyWithImpl(this._self, this._then);

  final TaskDto _self;
  final $Res Function(TaskDto) _then;

/// Create a copy of TaskDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? taskId = null,Object? taskFileName = null,Object? dateCreated = null,Object? dateDone = null,Object? type = null,Object? status = null,Object? result = null,Object? acknowledged = null,Object? relatedDocument = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,taskId: null == taskId ? _self.taskId : taskId // ignore: cast_nullable_to_non_nullable
as String,taskFileName: null == taskFileName ? _self.taskFileName : taskFileName // ignore: cast_nullable_to_non_nullable
as String,dateCreated: null == dateCreated ? _self.dateCreated : dateCreated // ignore: cast_nullable_to_non_nullable
as String,dateDone: null == dateDone ? _self.dateDone : dateDone // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,result: null == result ? _self.result : result // ignore: cast_nullable_to_non_nullable
as String,acknowledged: null == acknowledged ? _self.acknowledged : acknowledged // ignore: cast_nullable_to_non_nullable
as String,relatedDocument: freezed == relatedDocument ? _self.relatedDocument : relatedDocument // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [TaskDto].
extension TaskDtoPatterns on TaskDto {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TaskDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TaskDto() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TaskDto value)  $default,){
final _that = this;
switch (_that) {
case _TaskDto():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TaskDto value)?  $default,){
final _that = this;
switch (_that) {
case _TaskDto() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id, @JsonKey(name: 'task_id')  String taskId, @JsonKey(name: 'task_file_name')  String taskFileName, @JsonKey(name: 'date_created')  String dateCreated, @JsonKey(name: 'date_done')  String dateDone,  String type,  String status,  String result,  String acknowledged, @JsonKey(name: 'related_document')  String? relatedDocument)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TaskDto() when $default != null:
return $default(_that.id,_that.taskId,_that.taskFileName,_that.dateCreated,_that.dateDone,_that.type,_that.status,_that.result,_that.acknowledged,_that.relatedDocument);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id, @JsonKey(name: 'task_id')  String taskId, @JsonKey(name: 'task_file_name')  String taskFileName, @JsonKey(name: 'date_created')  String dateCreated, @JsonKey(name: 'date_done')  String dateDone,  String type,  String status,  String result,  String acknowledged, @JsonKey(name: 'related_document')  String? relatedDocument)  $default,) {final _that = this;
switch (_that) {
case _TaskDto():
return $default(_that.id,_that.taskId,_that.taskFileName,_that.dateCreated,_that.dateDone,_that.type,_that.status,_that.result,_that.acknowledged,_that.relatedDocument);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id, @JsonKey(name: 'task_id')  String taskId, @JsonKey(name: 'task_file_name')  String taskFileName, @JsonKey(name: 'date_created')  String dateCreated, @JsonKey(name: 'date_done')  String dateDone,  String type,  String status,  String result,  String acknowledged, @JsonKey(name: 'related_document')  String? relatedDocument)?  $default,) {final _that = this;
switch (_that) {
case _TaskDto() when $default != null:
return $default(_that.id,_that.taskId,_that.taskFileName,_that.dateCreated,_that.dateDone,_that.type,_that.status,_that.result,_that.acknowledged,_that.relatedDocument);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TaskDto implements TaskDto {
  const _TaskDto({required this.id, @JsonKey(name: 'task_id') required this.taskId, @JsonKey(name: 'task_file_name') required this.taskFileName, @JsonKey(name: 'date_created') required this.dateCreated, @JsonKey(name: 'date_done') required this.dateDone, required this.type, required this.status, required this.result, required this.acknowledged, @JsonKey(name: 'related_document') required this.relatedDocument});
  factory _TaskDto.fromJson(Map<String, dynamic> json) => _$TaskDtoFromJson(json);

@override final  int id;
@override@JsonKey(name: 'task_id') final  String taskId;
@override@JsonKey(name: 'task_file_name') final  String taskFileName;
@override@JsonKey(name: 'date_created') final  String dateCreated;
@override@JsonKey(name: 'date_done') final  String dateDone;
@override final  String type;
@override final  String status;
@override final  String result;
@override final  String acknowledged;
@override@JsonKey(name: 'related_document') final  String? relatedDocument;

/// Create a copy of TaskDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TaskDtoCopyWith<_TaskDto> get copyWith => __$TaskDtoCopyWithImpl<_TaskDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TaskDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TaskDto&&(identical(other.id, id) || other.id == id)&&(identical(other.taskId, taskId) || other.taskId == taskId)&&(identical(other.taskFileName, taskFileName) || other.taskFileName == taskFileName)&&(identical(other.dateCreated, dateCreated) || other.dateCreated == dateCreated)&&(identical(other.dateDone, dateDone) || other.dateDone == dateDone)&&(identical(other.type, type) || other.type == type)&&(identical(other.status, status) || other.status == status)&&(identical(other.result, result) || other.result == result)&&(identical(other.acknowledged, acknowledged) || other.acknowledged == acknowledged)&&(identical(other.relatedDocument, relatedDocument) || other.relatedDocument == relatedDocument));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,taskId,taskFileName,dateCreated,dateDone,type,status,result,acknowledged,relatedDocument);

@override
String toString() {
  return 'TaskDto(id: $id, taskId: $taskId, taskFileName: $taskFileName, dateCreated: $dateCreated, dateDone: $dateDone, type: $type, status: $status, result: $result, acknowledged: $acknowledged, relatedDocument: $relatedDocument)';
}


}

/// @nodoc
abstract mixin class _$TaskDtoCopyWith<$Res> implements $TaskDtoCopyWith<$Res> {
  factory _$TaskDtoCopyWith(_TaskDto value, $Res Function(_TaskDto) _then) = __$TaskDtoCopyWithImpl;
@override @useResult
$Res call({
 int id,@JsonKey(name: 'task_id') String taskId,@JsonKey(name: 'task_file_name') String taskFileName,@JsonKey(name: 'date_created') String dateCreated,@JsonKey(name: 'date_done') String dateDone, String type, String status, String result, String acknowledged,@JsonKey(name: 'related_document') String? relatedDocument
});




}
/// @nodoc
class __$TaskDtoCopyWithImpl<$Res>
    implements _$TaskDtoCopyWith<$Res> {
  __$TaskDtoCopyWithImpl(this._self, this._then);

  final _TaskDto _self;
  final $Res Function(_TaskDto) _then;

/// Create a copy of TaskDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? taskId = null,Object? taskFileName = null,Object? dateCreated = null,Object? dateDone = null,Object? type = null,Object? status = null,Object? result = null,Object? acknowledged = null,Object? relatedDocument = freezed,}) {
  return _then(_TaskDto(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,taskId: null == taskId ? _self.taskId : taskId // ignore: cast_nullable_to_non_nullable
as String,taskFileName: null == taskFileName ? _self.taskFileName : taskFileName // ignore: cast_nullable_to_non_nullable
as String,dateCreated: null == dateCreated ? _self.dateCreated : dateCreated // ignore: cast_nullable_to_non_nullable
as String,dateDone: null == dateDone ? _self.dateDone : dateDone // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,result: null == result ? _self.result : result // ignore: cast_nullable_to_non_nullable
as String,acknowledged: null == acknowledged ? _self.acknowledged : acknowledged // ignore: cast_nullable_to_non_nullable
as String,relatedDocument: freezed == relatedDocument ? _self.relatedDocument : relatedDocument // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
