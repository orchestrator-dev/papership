// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'server_config_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ServerConfigState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ServerConfigState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ServerConfigState()';
}


}

/// @nodoc
class $ServerConfigStateCopyWith<$Res>  {
$ServerConfigStateCopyWith(ServerConfigState _, $Res Function(ServerConfigState) __);
}


/// Adds pattern-matching-related methods to [ServerConfigState].
extension ServerConfigStatePatterns on ServerConfigState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Empty value)?  empty,TResult Function( _List value)?  list,TResult Function( _Testing value)?  testing,TResult Function( _TestResult value)?  testResult,TResult Function( _Saving value)?  saving,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Empty() when empty != null:
return empty(_that);case _List() when list != null:
return list(_that);case _Testing() when testing != null:
return testing(_that);case _TestResult() when testResult != null:
return testResult(_that);case _Saving() when saving != null:
return saving(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Empty value)  empty,required TResult Function( _List value)  list,required TResult Function( _Testing value)  testing,required TResult Function( _TestResult value)  testResult,required TResult Function( _Saving value)  saving,}){
final _that = this;
switch (_that) {
case _Empty():
return empty(_that);case _List():
return list(_that);case _Testing():
return testing(_that);case _TestResult():
return testResult(_that);case _Saving():
return saving(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Empty value)?  empty,TResult? Function( _List value)?  list,TResult? Function( _Testing value)?  testing,TResult? Function( _TestResult value)?  testResult,TResult? Function( _Saving value)?  saving,}){
final _that = this;
switch (_that) {
case _Empty() when empty != null:
return empty(_that);case _List() when list != null:
return list(_that);case _Testing() when testing != null:
return testing(_that);case _TestResult() when testResult != null:
return testResult(_that);case _Saving() when saving != null:
return saving(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  empty,TResult Function( List<ServerConfig> configs,  String? activeId)?  list,TResult Function()?  testing,TResult Function( bool success,  String? errorMessage)?  testResult,TResult Function()?  saving,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Empty() when empty != null:
return empty();case _List() when list != null:
return list(_that.configs,_that.activeId);case _Testing() when testing != null:
return testing();case _TestResult() when testResult != null:
return testResult(_that.success,_that.errorMessage);case _Saving() when saving != null:
return saving();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  empty,required TResult Function( List<ServerConfig> configs,  String? activeId)  list,required TResult Function()  testing,required TResult Function( bool success,  String? errorMessage)  testResult,required TResult Function()  saving,}) {final _that = this;
switch (_that) {
case _Empty():
return empty();case _List():
return list(_that.configs,_that.activeId);case _Testing():
return testing();case _TestResult():
return testResult(_that.success,_that.errorMessage);case _Saving():
return saving();case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  empty,TResult? Function( List<ServerConfig> configs,  String? activeId)?  list,TResult? Function()?  testing,TResult? Function( bool success,  String? errorMessage)?  testResult,TResult? Function()?  saving,}) {final _that = this;
switch (_that) {
case _Empty() when empty != null:
return empty();case _List() when list != null:
return list(_that.configs,_that.activeId);case _Testing() when testing != null:
return testing();case _TestResult() when testResult != null:
return testResult(_that.success,_that.errorMessage);case _Saving() when saving != null:
return saving();case _:
  return null;

}
}

}

/// @nodoc


class _Empty implements ServerConfigState {
  const _Empty();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Empty);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ServerConfigState.empty()';
}


}




/// @nodoc


class _List implements ServerConfigState {
  const _List({required final  List<ServerConfig> configs, this.activeId}): _configs = configs;
  

 final  List<ServerConfig> _configs;
 List<ServerConfig> get configs {
  if (_configs is EqualUnmodifiableListView) return _configs;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_configs);
}

 final  String? activeId;

/// Create a copy of ServerConfigState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ListCopyWith<_List> get copyWith => __$ListCopyWithImpl<_List>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _List&&const DeepCollectionEquality().equals(other._configs, _configs)&&(identical(other.activeId, activeId) || other.activeId == activeId));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_configs),activeId);

@override
String toString() {
  return 'ServerConfigState.list(configs: $configs, activeId: $activeId)';
}


}

/// @nodoc
abstract mixin class _$ListCopyWith<$Res> implements $ServerConfigStateCopyWith<$Res> {
  factory _$ListCopyWith(_List value, $Res Function(_List) _then) = __$ListCopyWithImpl;
@useResult
$Res call({
 List<ServerConfig> configs, String? activeId
});




}
/// @nodoc
class __$ListCopyWithImpl<$Res>
    implements _$ListCopyWith<$Res> {
  __$ListCopyWithImpl(this._self, this._then);

  final _List _self;
  final $Res Function(_List) _then;

/// Create a copy of ServerConfigState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? configs = null,Object? activeId = freezed,}) {
  return _then(_List(
configs: null == configs ? _self._configs : configs // ignore: cast_nullable_to_non_nullable
as List<ServerConfig>,activeId: freezed == activeId ? _self.activeId : activeId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc


class _Testing implements ServerConfigState {
  const _Testing();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Testing);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ServerConfigState.testing()';
}


}




/// @nodoc


class _TestResult implements ServerConfigState {
  const _TestResult({required this.success, this.errorMessage});
  

 final  bool success;
 final  String? errorMessage;

/// Create a copy of ServerConfigState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TestResultCopyWith<_TestResult> get copyWith => __$TestResultCopyWithImpl<_TestResult>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TestResult&&(identical(other.success, success) || other.success == success)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,success,errorMessage);

@override
String toString() {
  return 'ServerConfigState.testResult(success: $success, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class _$TestResultCopyWith<$Res> implements $ServerConfigStateCopyWith<$Res> {
  factory _$TestResultCopyWith(_TestResult value, $Res Function(_TestResult) _then) = __$TestResultCopyWithImpl;
@useResult
$Res call({
 bool success, String? errorMessage
});




}
/// @nodoc
class __$TestResultCopyWithImpl<$Res>
    implements _$TestResultCopyWith<$Res> {
  __$TestResultCopyWithImpl(this._self, this._then);

  final _TestResult _self;
  final $Res Function(_TestResult) _then;

/// Create a copy of ServerConfigState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? success = null,Object? errorMessage = freezed,}) {
  return _then(_TestResult(
success: null == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc


class _Saving implements ServerConfigState {
  const _Saving();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Saving);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ServerConfigState.saving()';
}


}




// dart format on
