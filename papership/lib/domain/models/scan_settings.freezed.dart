// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'scan_settings.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ScanSettings {

 InputSource get inputSource; ColorMode get colorMode; int get resolution; DocumentFormat get format; bool get duplex; ScanRegion? get scanRegion;
/// Create a copy of ScanSettings
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ScanSettingsCopyWith<ScanSettings> get copyWith => _$ScanSettingsCopyWithImpl<ScanSettings>(this as ScanSettings, _$identity);

  /// Serializes this ScanSettings to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ScanSettings&&(identical(other.inputSource, inputSource) || other.inputSource == inputSource)&&(identical(other.colorMode, colorMode) || other.colorMode == colorMode)&&(identical(other.resolution, resolution) || other.resolution == resolution)&&(identical(other.format, format) || other.format == format)&&(identical(other.duplex, duplex) || other.duplex == duplex)&&(identical(other.scanRegion, scanRegion) || other.scanRegion == scanRegion));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,inputSource,colorMode,resolution,format,duplex,scanRegion);

@override
String toString() {
  return 'ScanSettings(inputSource: $inputSource, colorMode: $colorMode, resolution: $resolution, format: $format, duplex: $duplex, scanRegion: $scanRegion)';
}


}

/// @nodoc
abstract mixin class $ScanSettingsCopyWith<$Res>  {
  factory $ScanSettingsCopyWith(ScanSettings value, $Res Function(ScanSettings) _then) = _$ScanSettingsCopyWithImpl;
@useResult
$Res call({
 InputSource inputSource, ColorMode colorMode, int resolution, DocumentFormat format, bool duplex, ScanRegion? scanRegion
});


$ScanRegionCopyWith<$Res>? get scanRegion;

}
/// @nodoc
class _$ScanSettingsCopyWithImpl<$Res>
    implements $ScanSettingsCopyWith<$Res> {
  _$ScanSettingsCopyWithImpl(this._self, this._then);

  final ScanSettings _self;
  final $Res Function(ScanSettings) _then;

/// Create a copy of ScanSettings
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? inputSource = null,Object? colorMode = null,Object? resolution = null,Object? format = null,Object? duplex = null,Object? scanRegion = freezed,}) {
  return _then(_self.copyWith(
inputSource: null == inputSource ? _self.inputSource : inputSource // ignore: cast_nullable_to_non_nullable
as InputSource,colorMode: null == colorMode ? _self.colorMode : colorMode // ignore: cast_nullable_to_non_nullable
as ColorMode,resolution: null == resolution ? _self.resolution : resolution // ignore: cast_nullable_to_non_nullable
as int,format: null == format ? _self.format : format // ignore: cast_nullable_to_non_nullable
as DocumentFormat,duplex: null == duplex ? _self.duplex : duplex // ignore: cast_nullable_to_non_nullable
as bool,scanRegion: freezed == scanRegion ? _self.scanRegion : scanRegion // ignore: cast_nullable_to_non_nullable
as ScanRegion?,
  ));
}
/// Create a copy of ScanSettings
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ScanRegionCopyWith<$Res>? get scanRegion {
    if (_self.scanRegion == null) {
    return null;
  }

  return $ScanRegionCopyWith<$Res>(_self.scanRegion!, (value) {
    return _then(_self.copyWith(scanRegion: value));
  });
}
}


/// Adds pattern-matching-related methods to [ScanSettings].
extension ScanSettingsPatterns on ScanSettings {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ScanSettings value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ScanSettings() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ScanSettings value)  $default,){
final _that = this;
switch (_that) {
case _ScanSettings():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ScanSettings value)?  $default,){
final _that = this;
switch (_that) {
case _ScanSettings() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( InputSource inputSource,  ColorMode colorMode,  int resolution,  DocumentFormat format,  bool duplex,  ScanRegion? scanRegion)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ScanSettings() when $default != null:
return $default(_that.inputSource,_that.colorMode,_that.resolution,_that.format,_that.duplex,_that.scanRegion);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( InputSource inputSource,  ColorMode colorMode,  int resolution,  DocumentFormat format,  bool duplex,  ScanRegion? scanRegion)  $default,) {final _that = this;
switch (_that) {
case _ScanSettings():
return $default(_that.inputSource,_that.colorMode,_that.resolution,_that.format,_that.duplex,_that.scanRegion);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( InputSource inputSource,  ColorMode colorMode,  int resolution,  DocumentFormat format,  bool duplex,  ScanRegion? scanRegion)?  $default,) {final _that = this;
switch (_that) {
case _ScanSettings() when $default != null:
return $default(_that.inputSource,_that.colorMode,_that.resolution,_that.format,_that.duplex,_that.scanRegion);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ScanSettings implements ScanSettings {
  const _ScanSettings({required this.inputSource, required this.colorMode, required this.resolution, required this.format, this.duplex = false, this.scanRegion});
  factory _ScanSettings.fromJson(Map<String, dynamic> json) => _$ScanSettingsFromJson(json);

@override final  InputSource inputSource;
@override final  ColorMode colorMode;
@override final  int resolution;
@override final  DocumentFormat format;
@override@JsonKey() final  bool duplex;
@override final  ScanRegion? scanRegion;

/// Create a copy of ScanSettings
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ScanSettingsCopyWith<_ScanSettings> get copyWith => __$ScanSettingsCopyWithImpl<_ScanSettings>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ScanSettingsToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ScanSettings&&(identical(other.inputSource, inputSource) || other.inputSource == inputSource)&&(identical(other.colorMode, colorMode) || other.colorMode == colorMode)&&(identical(other.resolution, resolution) || other.resolution == resolution)&&(identical(other.format, format) || other.format == format)&&(identical(other.duplex, duplex) || other.duplex == duplex)&&(identical(other.scanRegion, scanRegion) || other.scanRegion == scanRegion));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,inputSource,colorMode,resolution,format,duplex,scanRegion);

@override
String toString() {
  return 'ScanSettings(inputSource: $inputSource, colorMode: $colorMode, resolution: $resolution, format: $format, duplex: $duplex, scanRegion: $scanRegion)';
}


}

/// @nodoc
abstract mixin class _$ScanSettingsCopyWith<$Res> implements $ScanSettingsCopyWith<$Res> {
  factory _$ScanSettingsCopyWith(_ScanSettings value, $Res Function(_ScanSettings) _then) = __$ScanSettingsCopyWithImpl;
@override @useResult
$Res call({
 InputSource inputSource, ColorMode colorMode, int resolution, DocumentFormat format, bool duplex, ScanRegion? scanRegion
});


@override $ScanRegionCopyWith<$Res>? get scanRegion;

}
/// @nodoc
class __$ScanSettingsCopyWithImpl<$Res>
    implements _$ScanSettingsCopyWith<$Res> {
  __$ScanSettingsCopyWithImpl(this._self, this._then);

  final _ScanSettings _self;
  final $Res Function(_ScanSettings) _then;

/// Create a copy of ScanSettings
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? inputSource = null,Object? colorMode = null,Object? resolution = null,Object? format = null,Object? duplex = null,Object? scanRegion = freezed,}) {
  return _then(_ScanSettings(
inputSource: null == inputSource ? _self.inputSource : inputSource // ignore: cast_nullable_to_non_nullable
as InputSource,colorMode: null == colorMode ? _self.colorMode : colorMode // ignore: cast_nullable_to_non_nullable
as ColorMode,resolution: null == resolution ? _self.resolution : resolution // ignore: cast_nullable_to_non_nullable
as int,format: null == format ? _self.format : format // ignore: cast_nullable_to_non_nullable
as DocumentFormat,duplex: null == duplex ? _self.duplex : duplex // ignore: cast_nullable_to_non_nullable
as bool,scanRegion: freezed == scanRegion ? _self.scanRegion : scanRegion // ignore: cast_nullable_to_non_nullable
as ScanRegion?,
  ));
}

/// Create a copy of ScanSettings
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ScanRegionCopyWith<$Res>? get scanRegion {
    if (_self.scanRegion == null) {
    return null;
  }

  return $ScanRegionCopyWith<$Res>(_self.scanRegion!, (value) {
    return _then(_self.copyWith(scanRegion: value));
  });
}
}

// dart format on
