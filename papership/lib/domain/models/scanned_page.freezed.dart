// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'scanned_page.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ScannedPage {

 String get id; ScannedPageSource get source; Uint8List get imageBytes; int get rotationDegrees; bool get excluded; String? get thumbnailPath; double? get enhancedContrast; double? get brightnessAdjust;
/// Create a copy of ScannedPage
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ScannedPageCopyWith<ScannedPage> get copyWith => _$ScannedPageCopyWithImpl<ScannedPage>(this as ScannedPage, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ScannedPage&&(identical(other.id, id) || other.id == id)&&(identical(other.source, source) || other.source == source)&&const DeepCollectionEquality().equals(other.imageBytes, imageBytes)&&(identical(other.rotationDegrees, rotationDegrees) || other.rotationDegrees == rotationDegrees)&&(identical(other.excluded, excluded) || other.excluded == excluded)&&(identical(other.thumbnailPath, thumbnailPath) || other.thumbnailPath == thumbnailPath)&&(identical(other.enhancedContrast, enhancedContrast) || other.enhancedContrast == enhancedContrast)&&(identical(other.brightnessAdjust, brightnessAdjust) || other.brightnessAdjust == brightnessAdjust));
}


@override
int get hashCode => Object.hash(runtimeType,id,source,const DeepCollectionEquality().hash(imageBytes),rotationDegrees,excluded,thumbnailPath,enhancedContrast,brightnessAdjust);

@override
String toString() {
  return 'ScannedPage(id: $id, source: $source, imageBytes: $imageBytes, rotationDegrees: $rotationDegrees, excluded: $excluded, thumbnailPath: $thumbnailPath, enhancedContrast: $enhancedContrast, brightnessAdjust: $brightnessAdjust)';
}


}

/// @nodoc
abstract mixin class $ScannedPageCopyWith<$Res>  {
  factory $ScannedPageCopyWith(ScannedPage value, $Res Function(ScannedPage) _then) = _$ScannedPageCopyWithImpl;
@useResult
$Res call({
 String id, ScannedPageSource source, Uint8List imageBytes, int rotationDegrees, bool excluded, String? thumbnailPath, double? enhancedContrast, double? brightnessAdjust
});




}
/// @nodoc
class _$ScannedPageCopyWithImpl<$Res>
    implements $ScannedPageCopyWith<$Res> {
  _$ScannedPageCopyWithImpl(this._self, this._then);

  final ScannedPage _self;
  final $Res Function(ScannedPage) _then;

/// Create a copy of ScannedPage
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? source = null,Object? imageBytes = null,Object? rotationDegrees = null,Object? excluded = null,Object? thumbnailPath = freezed,Object? enhancedContrast = freezed,Object? brightnessAdjust = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,source: null == source ? _self.source : source // ignore: cast_nullable_to_non_nullable
as ScannedPageSource,imageBytes: null == imageBytes ? _self.imageBytes : imageBytes // ignore: cast_nullable_to_non_nullable
as Uint8List,rotationDegrees: null == rotationDegrees ? _self.rotationDegrees : rotationDegrees // ignore: cast_nullable_to_non_nullable
as int,excluded: null == excluded ? _self.excluded : excluded // ignore: cast_nullable_to_non_nullable
as bool,thumbnailPath: freezed == thumbnailPath ? _self.thumbnailPath : thumbnailPath // ignore: cast_nullable_to_non_nullable
as String?,enhancedContrast: freezed == enhancedContrast ? _self.enhancedContrast : enhancedContrast // ignore: cast_nullable_to_non_nullable
as double?,brightnessAdjust: freezed == brightnessAdjust ? _self.brightnessAdjust : brightnessAdjust // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}

}


/// Adds pattern-matching-related methods to [ScannedPage].
extension ScannedPagePatterns on ScannedPage {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ScannedPage value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ScannedPage() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ScannedPage value)  $default,){
final _that = this;
switch (_that) {
case _ScannedPage():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ScannedPage value)?  $default,){
final _that = this;
switch (_that) {
case _ScannedPage() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  ScannedPageSource source,  Uint8List imageBytes,  int rotationDegrees,  bool excluded,  String? thumbnailPath,  double? enhancedContrast,  double? brightnessAdjust)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ScannedPage() when $default != null:
return $default(_that.id,_that.source,_that.imageBytes,_that.rotationDegrees,_that.excluded,_that.thumbnailPath,_that.enhancedContrast,_that.brightnessAdjust);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  ScannedPageSource source,  Uint8List imageBytes,  int rotationDegrees,  bool excluded,  String? thumbnailPath,  double? enhancedContrast,  double? brightnessAdjust)  $default,) {final _that = this;
switch (_that) {
case _ScannedPage():
return $default(_that.id,_that.source,_that.imageBytes,_that.rotationDegrees,_that.excluded,_that.thumbnailPath,_that.enhancedContrast,_that.brightnessAdjust);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  ScannedPageSource source,  Uint8List imageBytes,  int rotationDegrees,  bool excluded,  String? thumbnailPath,  double? enhancedContrast,  double? brightnessAdjust)?  $default,) {final _that = this;
switch (_that) {
case _ScannedPage() when $default != null:
return $default(_that.id,_that.source,_that.imageBytes,_that.rotationDegrees,_that.excluded,_that.thumbnailPath,_that.enhancedContrast,_that.brightnessAdjust);case _:
  return null;

}
}

}

/// @nodoc


class _ScannedPage implements ScannedPage {
  const _ScannedPage({required this.id, required this.source, required this.imageBytes, this.rotationDegrees = 0, this.excluded = false, this.thumbnailPath, this.enhancedContrast, this.brightnessAdjust});
  

@override final  String id;
@override final  ScannedPageSource source;
@override final  Uint8List imageBytes;
@override@JsonKey() final  int rotationDegrees;
@override@JsonKey() final  bool excluded;
@override final  String? thumbnailPath;
@override final  double? enhancedContrast;
@override final  double? brightnessAdjust;

/// Create a copy of ScannedPage
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ScannedPageCopyWith<_ScannedPage> get copyWith => __$ScannedPageCopyWithImpl<_ScannedPage>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ScannedPage&&(identical(other.id, id) || other.id == id)&&(identical(other.source, source) || other.source == source)&&const DeepCollectionEquality().equals(other.imageBytes, imageBytes)&&(identical(other.rotationDegrees, rotationDegrees) || other.rotationDegrees == rotationDegrees)&&(identical(other.excluded, excluded) || other.excluded == excluded)&&(identical(other.thumbnailPath, thumbnailPath) || other.thumbnailPath == thumbnailPath)&&(identical(other.enhancedContrast, enhancedContrast) || other.enhancedContrast == enhancedContrast)&&(identical(other.brightnessAdjust, brightnessAdjust) || other.brightnessAdjust == brightnessAdjust));
}


@override
int get hashCode => Object.hash(runtimeType,id,source,const DeepCollectionEquality().hash(imageBytes),rotationDegrees,excluded,thumbnailPath,enhancedContrast,brightnessAdjust);

@override
String toString() {
  return 'ScannedPage(id: $id, source: $source, imageBytes: $imageBytes, rotationDegrees: $rotationDegrees, excluded: $excluded, thumbnailPath: $thumbnailPath, enhancedContrast: $enhancedContrast, brightnessAdjust: $brightnessAdjust)';
}


}

/// @nodoc
abstract mixin class _$ScannedPageCopyWith<$Res> implements $ScannedPageCopyWith<$Res> {
  factory _$ScannedPageCopyWith(_ScannedPage value, $Res Function(_ScannedPage) _then) = __$ScannedPageCopyWithImpl;
@override @useResult
$Res call({
 String id, ScannedPageSource source, Uint8List imageBytes, int rotationDegrees, bool excluded, String? thumbnailPath, double? enhancedContrast, double? brightnessAdjust
});




}
/// @nodoc
class __$ScannedPageCopyWithImpl<$Res>
    implements _$ScannedPageCopyWith<$Res> {
  __$ScannedPageCopyWithImpl(this._self, this._then);

  final _ScannedPage _self;
  final $Res Function(_ScannedPage) _then;

/// Create a copy of ScannedPage
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? source = null,Object? imageBytes = null,Object? rotationDegrees = null,Object? excluded = null,Object? thumbnailPath = freezed,Object? enhancedContrast = freezed,Object? brightnessAdjust = freezed,}) {
  return _then(_ScannedPage(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,source: null == source ? _self.source : source // ignore: cast_nullable_to_non_nullable
as ScannedPageSource,imageBytes: null == imageBytes ? _self.imageBytes : imageBytes // ignore: cast_nullable_to_non_nullable
as Uint8List,rotationDegrees: null == rotationDegrees ? _self.rotationDegrees : rotationDegrees // ignore: cast_nullable_to_non_nullable
as int,excluded: null == excluded ? _self.excluded : excluded // ignore: cast_nullable_to_non_nullable
as bool,thumbnailPath: freezed == thumbnailPath ? _self.thumbnailPath : thumbnailPath // ignore: cast_nullable_to_non_nullable
as String?,enhancedContrast: freezed == enhancedContrast ? _self.enhancedContrast : enhancedContrast // ignore: cast_nullable_to_non_nullable
as double?,brightnessAdjust: freezed == brightnessAdjust ? _self.brightnessAdjust : brightnessAdjust // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}


}

// dart format on
