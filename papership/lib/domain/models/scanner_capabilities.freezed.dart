// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'scanner_capabilities.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ScannerCapabilities {

 String get makeAndModel; List<InputSource> get inputSources; List<ColorMode> get colorModes; List<int> get supportedResolutions; DocumentFormat get defaultFormat; List<DocumentFormat> get supportedFormats; ScanRegion get maxScanRegion; bool get supportsAdf; bool get supportsDuplex; String? get serialNumber; String? get adminUri;
/// Create a copy of ScannerCapabilities
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ScannerCapabilitiesCopyWith<ScannerCapabilities> get copyWith => _$ScannerCapabilitiesCopyWithImpl<ScannerCapabilities>(this as ScannerCapabilities, _$identity);

  /// Serializes this ScannerCapabilities to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ScannerCapabilities&&(identical(other.makeAndModel, makeAndModel) || other.makeAndModel == makeAndModel)&&const DeepCollectionEquality().equals(other.inputSources, inputSources)&&const DeepCollectionEquality().equals(other.colorModes, colorModes)&&const DeepCollectionEquality().equals(other.supportedResolutions, supportedResolutions)&&(identical(other.defaultFormat, defaultFormat) || other.defaultFormat == defaultFormat)&&const DeepCollectionEquality().equals(other.supportedFormats, supportedFormats)&&(identical(other.maxScanRegion, maxScanRegion) || other.maxScanRegion == maxScanRegion)&&(identical(other.supportsAdf, supportsAdf) || other.supportsAdf == supportsAdf)&&(identical(other.supportsDuplex, supportsDuplex) || other.supportsDuplex == supportsDuplex)&&(identical(other.serialNumber, serialNumber) || other.serialNumber == serialNumber)&&(identical(other.adminUri, adminUri) || other.adminUri == adminUri));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,makeAndModel,const DeepCollectionEquality().hash(inputSources),const DeepCollectionEquality().hash(colorModes),const DeepCollectionEquality().hash(supportedResolutions),defaultFormat,const DeepCollectionEquality().hash(supportedFormats),maxScanRegion,supportsAdf,supportsDuplex,serialNumber,adminUri);

@override
String toString() {
  return 'ScannerCapabilities(makeAndModel: $makeAndModel, inputSources: $inputSources, colorModes: $colorModes, supportedResolutions: $supportedResolutions, defaultFormat: $defaultFormat, supportedFormats: $supportedFormats, maxScanRegion: $maxScanRegion, supportsAdf: $supportsAdf, supportsDuplex: $supportsDuplex, serialNumber: $serialNumber, adminUri: $adminUri)';
}


}

/// @nodoc
abstract mixin class $ScannerCapabilitiesCopyWith<$Res>  {
  factory $ScannerCapabilitiesCopyWith(ScannerCapabilities value, $Res Function(ScannerCapabilities) _then) = _$ScannerCapabilitiesCopyWithImpl;
@useResult
$Res call({
 String makeAndModel, List<InputSource> inputSources, List<ColorMode> colorModes, List<int> supportedResolutions, DocumentFormat defaultFormat, List<DocumentFormat> supportedFormats, ScanRegion maxScanRegion, bool supportsAdf, bool supportsDuplex, String? serialNumber, String? adminUri
});


$ScanRegionCopyWith<$Res> get maxScanRegion;

}
/// @nodoc
class _$ScannerCapabilitiesCopyWithImpl<$Res>
    implements $ScannerCapabilitiesCopyWith<$Res> {
  _$ScannerCapabilitiesCopyWithImpl(this._self, this._then);

  final ScannerCapabilities _self;
  final $Res Function(ScannerCapabilities) _then;

/// Create a copy of ScannerCapabilities
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? makeAndModel = null,Object? inputSources = null,Object? colorModes = null,Object? supportedResolutions = null,Object? defaultFormat = null,Object? supportedFormats = null,Object? maxScanRegion = null,Object? supportsAdf = null,Object? supportsDuplex = null,Object? serialNumber = freezed,Object? adminUri = freezed,}) {
  return _then(_self.copyWith(
makeAndModel: null == makeAndModel ? _self.makeAndModel : makeAndModel // ignore: cast_nullable_to_non_nullable
as String,inputSources: null == inputSources ? _self.inputSources : inputSources // ignore: cast_nullable_to_non_nullable
as List<InputSource>,colorModes: null == colorModes ? _self.colorModes : colorModes // ignore: cast_nullable_to_non_nullable
as List<ColorMode>,supportedResolutions: null == supportedResolutions ? _self.supportedResolutions : supportedResolutions // ignore: cast_nullable_to_non_nullable
as List<int>,defaultFormat: null == defaultFormat ? _self.defaultFormat : defaultFormat // ignore: cast_nullable_to_non_nullable
as DocumentFormat,supportedFormats: null == supportedFormats ? _self.supportedFormats : supportedFormats // ignore: cast_nullable_to_non_nullable
as List<DocumentFormat>,maxScanRegion: null == maxScanRegion ? _self.maxScanRegion : maxScanRegion // ignore: cast_nullable_to_non_nullable
as ScanRegion,supportsAdf: null == supportsAdf ? _self.supportsAdf : supportsAdf // ignore: cast_nullable_to_non_nullable
as bool,supportsDuplex: null == supportsDuplex ? _self.supportsDuplex : supportsDuplex // ignore: cast_nullable_to_non_nullable
as bool,serialNumber: freezed == serialNumber ? _self.serialNumber : serialNumber // ignore: cast_nullable_to_non_nullable
as String?,adminUri: freezed == adminUri ? _self.adminUri : adminUri // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}
/// Create a copy of ScannerCapabilities
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ScanRegionCopyWith<$Res> get maxScanRegion {
  
  return $ScanRegionCopyWith<$Res>(_self.maxScanRegion, (value) {
    return _then(_self.copyWith(maxScanRegion: value));
  });
}
}


/// Adds pattern-matching-related methods to [ScannerCapabilities].
extension ScannerCapabilitiesPatterns on ScannerCapabilities {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ScannerCapabilities value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ScannerCapabilities() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ScannerCapabilities value)  $default,){
final _that = this;
switch (_that) {
case _ScannerCapabilities():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ScannerCapabilities value)?  $default,){
final _that = this;
switch (_that) {
case _ScannerCapabilities() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String makeAndModel,  List<InputSource> inputSources,  List<ColorMode> colorModes,  List<int> supportedResolutions,  DocumentFormat defaultFormat,  List<DocumentFormat> supportedFormats,  ScanRegion maxScanRegion,  bool supportsAdf,  bool supportsDuplex,  String? serialNumber,  String? adminUri)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ScannerCapabilities() when $default != null:
return $default(_that.makeAndModel,_that.inputSources,_that.colorModes,_that.supportedResolutions,_that.defaultFormat,_that.supportedFormats,_that.maxScanRegion,_that.supportsAdf,_that.supportsDuplex,_that.serialNumber,_that.adminUri);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String makeAndModel,  List<InputSource> inputSources,  List<ColorMode> colorModes,  List<int> supportedResolutions,  DocumentFormat defaultFormat,  List<DocumentFormat> supportedFormats,  ScanRegion maxScanRegion,  bool supportsAdf,  bool supportsDuplex,  String? serialNumber,  String? adminUri)  $default,) {final _that = this;
switch (_that) {
case _ScannerCapabilities():
return $default(_that.makeAndModel,_that.inputSources,_that.colorModes,_that.supportedResolutions,_that.defaultFormat,_that.supportedFormats,_that.maxScanRegion,_that.supportsAdf,_that.supportsDuplex,_that.serialNumber,_that.adminUri);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String makeAndModel,  List<InputSource> inputSources,  List<ColorMode> colorModes,  List<int> supportedResolutions,  DocumentFormat defaultFormat,  List<DocumentFormat> supportedFormats,  ScanRegion maxScanRegion,  bool supportsAdf,  bool supportsDuplex,  String? serialNumber,  String? adminUri)?  $default,) {final _that = this;
switch (_that) {
case _ScannerCapabilities() when $default != null:
return $default(_that.makeAndModel,_that.inputSources,_that.colorModes,_that.supportedResolutions,_that.defaultFormat,_that.supportedFormats,_that.maxScanRegion,_that.supportsAdf,_that.supportsDuplex,_that.serialNumber,_that.adminUri);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ScannerCapabilities implements ScannerCapabilities {
  const _ScannerCapabilities({required this.makeAndModel, required final  List<InputSource> inputSources, required final  List<ColorMode> colorModes, required final  List<int> supportedResolutions, required this.defaultFormat, required final  List<DocumentFormat> supportedFormats, required this.maxScanRegion, required this.supportsAdf, required this.supportsDuplex, this.serialNumber, this.adminUri}): _inputSources = inputSources,_colorModes = colorModes,_supportedResolutions = supportedResolutions,_supportedFormats = supportedFormats;
  factory _ScannerCapabilities.fromJson(Map<String, dynamic> json) => _$ScannerCapabilitiesFromJson(json);

@override final  String makeAndModel;
 final  List<InputSource> _inputSources;
@override List<InputSource> get inputSources {
  if (_inputSources is EqualUnmodifiableListView) return _inputSources;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_inputSources);
}

 final  List<ColorMode> _colorModes;
@override List<ColorMode> get colorModes {
  if (_colorModes is EqualUnmodifiableListView) return _colorModes;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_colorModes);
}

 final  List<int> _supportedResolutions;
@override List<int> get supportedResolutions {
  if (_supportedResolutions is EqualUnmodifiableListView) return _supportedResolutions;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_supportedResolutions);
}

@override final  DocumentFormat defaultFormat;
 final  List<DocumentFormat> _supportedFormats;
@override List<DocumentFormat> get supportedFormats {
  if (_supportedFormats is EqualUnmodifiableListView) return _supportedFormats;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_supportedFormats);
}

@override final  ScanRegion maxScanRegion;
@override final  bool supportsAdf;
@override final  bool supportsDuplex;
@override final  String? serialNumber;
@override final  String? adminUri;

/// Create a copy of ScannerCapabilities
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ScannerCapabilitiesCopyWith<_ScannerCapabilities> get copyWith => __$ScannerCapabilitiesCopyWithImpl<_ScannerCapabilities>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ScannerCapabilitiesToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ScannerCapabilities&&(identical(other.makeAndModel, makeAndModel) || other.makeAndModel == makeAndModel)&&const DeepCollectionEquality().equals(other._inputSources, _inputSources)&&const DeepCollectionEquality().equals(other._colorModes, _colorModes)&&const DeepCollectionEquality().equals(other._supportedResolutions, _supportedResolutions)&&(identical(other.defaultFormat, defaultFormat) || other.defaultFormat == defaultFormat)&&const DeepCollectionEquality().equals(other._supportedFormats, _supportedFormats)&&(identical(other.maxScanRegion, maxScanRegion) || other.maxScanRegion == maxScanRegion)&&(identical(other.supportsAdf, supportsAdf) || other.supportsAdf == supportsAdf)&&(identical(other.supportsDuplex, supportsDuplex) || other.supportsDuplex == supportsDuplex)&&(identical(other.serialNumber, serialNumber) || other.serialNumber == serialNumber)&&(identical(other.adminUri, adminUri) || other.adminUri == adminUri));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,makeAndModel,const DeepCollectionEquality().hash(_inputSources),const DeepCollectionEquality().hash(_colorModes),const DeepCollectionEquality().hash(_supportedResolutions),defaultFormat,const DeepCollectionEquality().hash(_supportedFormats),maxScanRegion,supportsAdf,supportsDuplex,serialNumber,adminUri);

@override
String toString() {
  return 'ScannerCapabilities(makeAndModel: $makeAndModel, inputSources: $inputSources, colorModes: $colorModes, supportedResolutions: $supportedResolutions, defaultFormat: $defaultFormat, supportedFormats: $supportedFormats, maxScanRegion: $maxScanRegion, supportsAdf: $supportsAdf, supportsDuplex: $supportsDuplex, serialNumber: $serialNumber, adminUri: $adminUri)';
}


}

/// @nodoc
abstract mixin class _$ScannerCapabilitiesCopyWith<$Res> implements $ScannerCapabilitiesCopyWith<$Res> {
  factory _$ScannerCapabilitiesCopyWith(_ScannerCapabilities value, $Res Function(_ScannerCapabilities) _then) = __$ScannerCapabilitiesCopyWithImpl;
@override @useResult
$Res call({
 String makeAndModel, List<InputSource> inputSources, List<ColorMode> colorModes, List<int> supportedResolutions, DocumentFormat defaultFormat, List<DocumentFormat> supportedFormats, ScanRegion maxScanRegion, bool supportsAdf, bool supportsDuplex, String? serialNumber, String? adminUri
});


@override $ScanRegionCopyWith<$Res> get maxScanRegion;

}
/// @nodoc
class __$ScannerCapabilitiesCopyWithImpl<$Res>
    implements _$ScannerCapabilitiesCopyWith<$Res> {
  __$ScannerCapabilitiesCopyWithImpl(this._self, this._then);

  final _ScannerCapabilities _self;
  final $Res Function(_ScannerCapabilities) _then;

/// Create a copy of ScannerCapabilities
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? makeAndModel = null,Object? inputSources = null,Object? colorModes = null,Object? supportedResolutions = null,Object? defaultFormat = null,Object? supportedFormats = null,Object? maxScanRegion = null,Object? supportsAdf = null,Object? supportsDuplex = null,Object? serialNumber = freezed,Object? adminUri = freezed,}) {
  return _then(_ScannerCapabilities(
makeAndModel: null == makeAndModel ? _self.makeAndModel : makeAndModel // ignore: cast_nullable_to_non_nullable
as String,inputSources: null == inputSources ? _self._inputSources : inputSources // ignore: cast_nullable_to_non_nullable
as List<InputSource>,colorModes: null == colorModes ? _self._colorModes : colorModes // ignore: cast_nullable_to_non_nullable
as List<ColorMode>,supportedResolutions: null == supportedResolutions ? _self._supportedResolutions : supportedResolutions // ignore: cast_nullable_to_non_nullable
as List<int>,defaultFormat: null == defaultFormat ? _self.defaultFormat : defaultFormat // ignore: cast_nullable_to_non_nullable
as DocumentFormat,supportedFormats: null == supportedFormats ? _self._supportedFormats : supportedFormats // ignore: cast_nullable_to_non_nullable
as List<DocumentFormat>,maxScanRegion: null == maxScanRegion ? _self.maxScanRegion : maxScanRegion // ignore: cast_nullable_to_non_nullable
as ScanRegion,supportsAdf: null == supportsAdf ? _self.supportsAdf : supportsAdf // ignore: cast_nullable_to_non_nullable
as bool,supportsDuplex: null == supportsDuplex ? _self.supportsDuplex : supportsDuplex // ignore: cast_nullable_to_non_nullable
as bool,serialNumber: freezed == serialNumber ? _self.serialNumber : serialNumber // ignore: cast_nullable_to_non_nullable
as String?,adminUri: freezed == adminUri ? _self.adminUri : adminUri // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of ScannerCapabilities
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ScanRegionCopyWith<$Res> get maxScanRegion {
  
  return $ScanRegionCopyWith<$Res>(_self.maxScanRegion, (value) {
    return _then(_self.copyWith(maxScanRegion: value));
  });
}
}


/// @nodoc
mixin _$ScanRegion {

 int get width; int get height;
/// Create a copy of ScanRegion
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ScanRegionCopyWith<ScanRegion> get copyWith => _$ScanRegionCopyWithImpl<ScanRegion>(this as ScanRegion, _$identity);

  /// Serializes this ScanRegion to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ScanRegion&&(identical(other.width, width) || other.width == width)&&(identical(other.height, height) || other.height == height));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,width,height);

@override
String toString() {
  return 'ScanRegion(width: $width, height: $height)';
}


}

/// @nodoc
abstract mixin class $ScanRegionCopyWith<$Res>  {
  factory $ScanRegionCopyWith(ScanRegion value, $Res Function(ScanRegion) _then) = _$ScanRegionCopyWithImpl;
@useResult
$Res call({
 int width, int height
});




}
/// @nodoc
class _$ScanRegionCopyWithImpl<$Res>
    implements $ScanRegionCopyWith<$Res> {
  _$ScanRegionCopyWithImpl(this._self, this._then);

  final ScanRegion _self;
  final $Res Function(ScanRegion) _then;

/// Create a copy of ScanRegion
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? width = null,Object? height = null,}) {
  return _then(_self.copyWith(
width: null == width ? _self.width : width // ignore: cast_nullable_to_non_nullable
as int,height: null == height ? _self.height : height // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [ScanRegion].
extension ScanRegionPatterns on ScanRegion {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ScanRegion value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ScanRegion() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ScanRegion value)  $default,){
final _that = this;
switch (_that) {
case _ScanRegion():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ScanRegion value)?  $default,){
final _that = this;
switch (_that) {
case _ScanRegion() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int width,  int height)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ScanRegion() when $default != null:
return $default(_that.width,_that.height);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int width,  int height)  $default,) {final _that = this;
switch (_that) {
case _ScanRegion():
return $default(_that.width,_that.height);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int width,  int height)?  $default,) {final _that = this;
switch (_that) {
case _ScanRegion() when $default != null:
return $default(_that.width,_that.height);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ScanRegion implements ScanRegion {
  const _ScanRegion({required this.width, required this.height});
  factory _ScanRegion.fromJson(Map<String, dynamic> json) => _$ScanRegionFromJson(json);

@override final  int width;
@override final  int height;

/// Create a copy of ScanRegion
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ScanRegionCopyWith<_ScanRegion> get copyWith => __$ScanRegionCopyWithImpl<_ScanRegion>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ScanRegionToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ScanRegion&&(identical(other.width, width) || other.width == width)&&(identical(other.height, height) || other.height == height));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,width,height);

@override
String toString() {
  return 'ScanRegion(width: $width, height: $height)';
}


}

/// @nodoc
abstract mixin class _$ScanRegionCopyWith<$Res> implements $ScanRegionCopyWith<$Res> {
  factory _$ScanRegionCopyWith(_ScanRegion value, $Res Function(_ScanRegion) _then) = __$ScanRegionCopyWithImpl;
@override @useResult
$Res call({
 int width, int height
});




}
/// @nodoc
class __$ScanRegionCopyWithImpl<$Res>
    implements _$ScanRegionCopyWith<$Res> {
  __$ScanRegionCopyWithImpl(this._self, this._then);

  final _ScanRegion _self;
  final $Res Function(_ScanRegion) _then;

/// Create a copy of ScanRegion
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? width = null,Object? height = null,}) {
  return _then(_ScanRegion(
width: null == width ? _self.width : width // ignore: cast_nullable_to_non_nullable
as int,height: null == height ? _self.height : height // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
