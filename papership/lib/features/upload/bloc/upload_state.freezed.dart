// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'upload_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$UploadState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UploadState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'UploadState()';
}


}

/// @nodoc
class $UploadStateCopyWith<$Res>  {
$UploadStateCopyWith(UploadState _, $Res Function(UploadState) __);
}


/// Adds pattern-matching-related methods to [UploadState].
extension UploadStatePatterns on UploadState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Idle value)?  idle,TResult Function( _LoadingMetadata value)?  loadingMetadata,TResult Function( _Ready value)?  ready,TResult Function( _Uploading value)?  uploading,TResult Function( _Success value)?  success,TResult Function( _Error value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Idle() when idle != null:
return idle(_that);case _LoadingMetadata() when loadingMetadata != null:
return loadingMetadata(_that);case _Ready() when ready != null:
return ready(_that);case _Uploading() when uploading != null:
return uploading(_that);case _Success() when success != null:
return success(_that);case _Error() when error != null:
return error(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Idle value)  idle,required TResult Function( _LoadingMetadata value)  loadingMetadata,required TResult Function( _Ready value)  ready,required TResult Function( _Uploading value)  uploading,required TResult Function( _Success value)  success,required TResult Function( _Error value)  error,}){
final _that = this;
switch (_that) {
case _Idle():
return idle(_that);case _LoadingMetadata():
return loadingMetadata(_that);case _Ready():
return ready(_that);case _Uploading():
return uploading(_that);case _Success():
return success(_that);case _Error():
return error(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Idle value)?  idle,TResult? Function( _LoadingMetadata value)?  loadingMetadata,TResult? Function( _Ready value)?  ready,TResult? Function( _Uploading value)?  uploading,TResult? Function( _Success value)?  success,TResult? Function( _Error value)?  error,}){
final _that = this;
switch (_that) {
case _Idle() when idle != null:
return idle(_that);case _LoadingMetadata() when loadingMetadata != null:
return loadingMetadata(_that);case _Ready() when ready != null:
return ready(_that);case _Uploading() when uploading != null:
return uploading(_that);case _Success() when success != null:
return success(_that);case _Error() when error != null:
return error(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  idle,TResult Function()?  loadingMetadata,TResult Function( List<TagDto> tags,  List<CorrespondentDto> correspondents,  List<DocumentTypeDto> documentTypes)?  ready,TResult Function( double progress)?  uploading,TResult Function( String taskId)?  success,TResult Function( String message)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Idle() when idle != null:
return idle();case _LoadingMetadata() when loadingMetadata != null:
return loadingMetadata();case _Ready() when ready != null:
return ready(_that.tags,_that.correspondents,_that.documentTypes);case _Uploading() when uploading != null:
return uploading(_that.progress);case _Success() when success != null:
return success(_that.taskId);case _Error() when error != null:
return error(_that.message);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  idle,required TResult Function()  loadingMetadata,required TResult Function( List<TagDto> tags,  List<CorrespondentDto> correspondents,  List<DocumentTypeDto> documentTypes)  ready,required TResult Function( double progress)  uploading,required TResult Function( String taskId)  success,required TResult Function( String message)  error,}) {final _that = this;
switch (_that) {
case _Idle():
return idle();case _LoadingMetadata():
return loadingMetadata();case _Ready():
return ready(_that.tags,_that.correspondents,_that.documentTypes);case _Uploading():
return uploading(_that.progress);case _Success():
return success(_that.taskId);case _Error():
return error(_that.message);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  idle,TResult? Function()?  loadingMetadata,TResult? Function( List<TagDto> tags,  List<CorrespondentDto> correspondents,  List<DocumentTypeDto> documentTypes)?  ready,TResult? Function( double progress)?  uploading,TResult? Function( String taskId)?  success,TResult? Function( String message)?  error,}) {final _that = this;
switch (_that) {
case _Idle() when idle != null:
return idle();case _LoadingMetadata() when loadingMetadata != null:
return loadingMetadata();case _Ready() when ready != null:
return ready(_that.tags,_that.correspondents,_that.documentTypes);case _Uploading() when uploading != null:
return uploading(_that.progress);case _Success() when success != null:
return success(_that.taskId);case _Error() when error != null:
return error(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class _Idle implements UploadState {
  const _Idle();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Idle);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'UploadState.idle()';
}


}




/// @nodoc


class _LoadingMetadata implements UploadState {
  const _LoadingMetadata();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LoadingMetadata);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'UploadState.loadingMetadata()';
}


}




/// @nodoc


class _Ready implements UploadState {
  const _Ready({final  List<TagDto> tags = const [], final  List<CorrespondentDto> correspondents = const [], final  List<DocumentTypeDto> documentTypes = const []}): _tags = tags,_correspondents = correspondents,_documentTypes = documentTypes;
  

 final  List<TagDto> _tags;
@JsonKey() List<TagDto> get tags {
  if (_tags is EqualUnmodifiableListView) return _tags;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_tags);
}

 final  List<CorrespondentDto> _correspondents;
@JsonKey() List<CorrespondentDto> get correspondents {
  if (_correspondents is EqualUnmodifiableListView) return _correspondents;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_correspondents);
}

 final  List<DocumentTypeDto> _documentTypes;
@JsonKey() List<DocumentTypeDto> get documentTypes {
  if (_documentTypes is EqualUnmodifiableListView) return _documentTypes;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_documentTypes);
}


/// Create a copy of UploadState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ReadyCopyWith<_Ready> get copyWith => __$ReadyCopyWithImpl<_Ready>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Ready&&const DeepCollectionEquality().equals(other._tags, _tags)&&const DeepCollectionEquality().equals(other._correspondents, _correspondents)&&const DeepCollectionEquality().equals(other._documentTypes, _documentTypes));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_tags),const DeepCollectionEquality().hash(_correspondents),const DeepCollectionEquality().hash(_documentTypes));

@override
String toString() {
  return 'UploadState.ready(tags: $tags, correspondents: $correspondents, documentTypes: $documentTypes)';
}


}

/// @nodoc
abstract mixin class _$ReadyCopyWith<$Res> implements $UploadStateCopyWith<$Res> {
  factory _$ReadyCopyWith(_Ready value, $Res Function(_Ready) _then) = __$ReadyCopyWithImpl;
@useResult
$Res call({
 List<TagDto> tags, List<CorrespondentDto> correspondents, List<DocumentTypeDto> documentTypes
});




}
/// @nodoc
class __$ReadyCopyWithImpl<$Res>
    implements _$ReadyCopyWith<$Res> {
  __$ReadyCopyWithImpl(this._self, this._then);

  final _Ready _self;
  final $Res Function(_Ready) _then;

/// Create a copy of UploadState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? tags = null,Object? correspondents = null,Object? documentTypes = null,}) {
  return _then(_Ready(
tags: null == tags ? _self._tags : tags // ignore: cast_nullable_to_non_nullable
as List<TagDto>,correspondents: null == correspondents ? _self._correspondents : correspondents // ignore: cast_nullable_to_non_nullable
as List<CorrespondentDto>,documentTypes: null == documentTypes ? _self._documentTypes : documentTypes // ignore: cast_nullable_to_non_nullable
as List<DocumentTypeDto>,
  ));
}


}

/// @nodoc


class _Uploading implements UploadState {
  const _Uploading(this.progress);
  

 final  double progress;

/// Create a copy of UploadState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UploadingCopyWith<_Uploading> get copyWith => __$UploadingCopyWithImpl<_Uploading>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Uploading&&(identical(other.progress, progress) || other.progress == progress));
}


@override
int get hashCode => Object.hash(runtimeType,progress);

@override
String toString() {
  return 'UploadState.uploading(progress: $progress)';
}


}

/// @nodoc
abstract mixin class _$UploadingCopyWith<$Res> implements $UploadStateCopyWith<$Res> {
  factory _$UploadingCopyWith(_Uploading value, $Res Function(_Uploading) _then) = __$UploadingCopyWithImpl;
@useResult
$Res call({
 double progress
});




}
/// @nodoc
class __$UploadingCopyWithImpl<$Res>
    implements _$UploadingCopyWith<$Res> {
  __$UploadingCopyWithImpl(this._self, this._then);

  final _Uploading _self;
  final $Res Function(_Uploading) _then;

/// Create a copy of UploadState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? progress = null,}) {
  return _then(_Uploading(
null == progress ? _self.progress : progress // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

/// @nodoc


class _Success implements UploadState {
  const _Success(this.taskId);
  

 final  String taskId;

/// Create a copy of UploadState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SuccessCopyWith<_Success> get copyWith => __$SuccessCopyWithImpl<_Success>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Success&&(identical(other.taskId, taskId) || other.taskId == taskId));
}


@override
int get hashCode => Object.hash(runtimeType,taskId);

@override
String toString() {
  return 'UploadState.success(taskId: $taskId)';
}


}

/// @nodoc
abstract mixin class _$SuccessCopyWith<$Res> implements $UploadStateCopyWith<$Res> {
  factory _$SuccessCopyWith(_Success value, $Res Function(_Success) _then) = __$SuccessCopyWithImpl;
@useResult
$Res call({
 String taskId
});




}
/// @nodoc
class __$SuccessCopyWithImpl<$Res>
    implements _$SuccessCopyWith<$Res> {
  __$SuccessCopyWithImpl(this._self, this._then);

  final _Success _self;
  final $Res Function(_Success) _then;

/// Create a copy of UploadState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? taskId = null,}) {
  return _then(_Success(
null == taskId ? _self.taskId : taskId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _Error implements UploadState {
  const _Error(this.message);
  

 final  String message;

/// Create a copy of UploadState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ErrorCopyWith<_Error> get copyWith => __$ErrorCopyWithImpl<_Error>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Error&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'UploadState.error(message: $message)';
}


}

/// @nodoc
abstract mixin class _$ErrorCopyWith<$Res> implements $UploadStateCopyWith<$Res> {
  factory _$ErrorCopyWith(_Error value, $Res Function(_Error) _then) = __$ErrorCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class __$ErrorCopyWithImpl<$Res>
    implements _$ErrorCopyWith<$Res> {
  __$ErrorCopyWithImpl(this._self, this._then);

  final _Error _self;
  final $Res Function(_Error) _then;

/// Create a copy of UploadState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(_Error(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
