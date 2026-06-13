// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'scan_job_status.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ScanJobStatus {

 ScanJobState get state; int? get age;
/// Create a copy of ScanJobStatus
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ScanJobStatusCopyWith<ScanJobStatus> get copyWith => _$ScanJobStatusCopyWithImpl<ScanJobStatus>(this as ScanJobStatus, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ScanJobStatus&&(identical(other.state, state) || other.state == state)&&(identical(other.age, age) || other.age == age));
}


@override
int get hashCode => Object.hash(runtimeType,state,age);

@override
String toString() {
  return 'ScanJobStatus(state: $state, age: $age)';
}


}

/// @nodoc
abstract mixin class $ScanJobStatusCopyWith<$Res>  {
  factory $ScanJobStatusCopyWith(ScanJobStatus value, $Res Function(ScanJobStatus) _then) = _$ScanJobStatusCopyWithImpl;
@useResult
$Res call({
 ScanJobState state, int? age
});




}
/// @nodoc
class _$ScanJobStatusCopyWithImpl<$Res>
    implements $ScanJobStatusCopyWith<$Res> {
  _$ScanJobStatusCopyWithImpl(this._self, this._then);

  final ScanJobStatus _self;
  final $Res Function(ScanJobStatus) _then;

/// Create a copy of ScanJobStatus
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? state = null,Object? age = freezed,}) {
  return _then(_self.copyWith(
state: null == state ? _self.state : state // ignore: cast_nullable_to_non_nullable
as ScanJobState,age: freezed == age ? _self.age : age // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [ScanJobStatus].
extension ScanJobStatusPatterns on ScanJobStatus {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ScanJobStatus value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ScanJobStatus() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ScanJobStatus value)  $default,){
final _that = this;
switch (_that) {
case _ScanJobStatus():
return $default(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ScanJobStatus value)?  $default,){
final _that = this;
switch (_that) {
case _ScanJobStatus() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( ScanJobState state,  int? age)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ScanJobStatus() when $default != null:
return $default(_that.state,_that.age);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( ScanJobState state,  int? age)  $default,) {final _that = this;
switch (_that) {
case _ScanJobStatus():
return $default(_that.state,_that.age);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( ScanJobState state,  int? age)?  $default,) {final _that = this;
switch (_that) {
case _ScanJobStatus() when $default != null:
return $default(_that.state,_that.age);case _:
  return null;

}
}

}

/// @nodoc


class _ScanJobStatus implements ScanJobStatus {
  const _ScanJobStatus({required this.state, this.age});
  

@override final  ScanJobState state;
@override final  int? age;

/// Create a copy of ScanJobStatus
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ScanJobStatusCopyWith<_ScanJobStatus> get copyWith => __$ScanJobStatusCopyWithImpl<_ScanJobStatus>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ScanJobStatus&&(identical(other.state, state) || other.state == state)&&(identical(other.age, age) || other.age == age));
}


@override
int get hashCode => Object.hash(runtimeType,state,age);

@override
String toString() {
  return 'ScanJobStatus(state: $state, age: $age)';
}


}

/// @nodoc
abstract mixin class _$ScanJobStatusCopyWith<$Res> implements $ScanJobStatusCopyWith<$Res> {
  factory _$ScanJobStatusCopyWith(_ScanJobStatus value, $Res Function(_ScanJobStatus) _then) = __$ScanJobStatusCopyWithImpl;
@override @useResult
$Res call({
 ScanJobState state, int? age
});




}
/// @nodoc
class __$ScanJobStatusCopyWithImpl<$Res>
    implements _$ScanJobStatusCopyWith<$Res> {
  __$ScanJobStatusCopyWithImpl(this._self, this._then);

  final _ScanJobStatus _self;
  final $Res Function(_ScanJobStatus) _then;

/// Create a copy of ScanJobStatus
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? state = null,Object? age = freezed,}) {
  return _then(_ScanJobStatus(
state: null == state ? _self.state : state // ignore: cast_nullable_to_non_nullable
as ScanJobState,age: freezed == age ? _self.age : age // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

// dart format on
