// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'discovered_scanner.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DiscoveredScanner {

 String get id; String get displayName; String get host; int get port; bool get useTls; String get esclRoot; ScannerCapabilities? get capabilities;
/// Create a copy of DiscoveredScanner
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DiscoveredScannerCopyWith<DiscoveredScanner> get copyWith => _$DiscoveredScannerCopyWithImpl<DiscoveredScanner>(this as DiscoveredScanner, _$identity);

  /// Serializes this DiscoveredScanner to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DiscoveredScanner&&(identical(other.id, id) || other.id == id)&&(identical(other.displayName, displayName) || other.displayName == displayName)&&(identical(other.host, host) || other.host == host)&&(identical(other.port, port) || other.port == port)&&(identical(other.useTls, useTls) || other.useTls == useTls)&&(identical(other.esclRoot, esclRoot) || other.esclRoot == esclRoot)&&(identical(other.capabilities, capabilities) || other.capabilities == capabilities));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,displayName,host,port,useTls,esclRoot,capabilities);

@override
String toString() {
  return 'DiscoveredScanner(id: $id, displayName: $displayName, host: $host, port: $port, useTls: $useTls, esclRoot: $esclRoot, capabilities: $capabilities)';
}


}

/// @nodoc
abstract mixin class $DiscoveredScannerCopyWith<$Res>  {
  factory $DiscoveredScannerCopyWith(DiscoveredScanner value, $Res Function(DiscoveredScanner) _then) = _$DiscoveredScannerCopyWithImpl;
@useResult
$Res call({
 String id, String displayName, String host, int port, bool useTls, String esclRoot, ScannerCapabilities? capabilities
});


$ScannerCapabilitiesCopyWith<$Res>? get capabilities;

}
/// @nodoc
class _$DiscoveredScannerCopyWithImpl<$Res>
    implements $DiscoveredScannerCopyWith<$Res> {
  _$DiscoveredScannerCopyWithImpl(this._self, this._then);

  final DiscoveredScanner _self;
  final $Res Function(DiscoveredScanner) _then;

/// Create a copy of DiscoveredScanner
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? displayName = null,Object? host = null,Object? port = null,Object? useTls = null,Object? esclRoot = null,Object? capabilities = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,displayName: null == displayName ? _self.displayName : displayName // ignore: cast_nullable_to_non_nullable
as String,host: null == host ? _self.host : host // ignore: cast_nullable_to_non_nullable
as String,port: null == port ? _self.port : port // ignore: cast_nullable_to_non_nullable
as int,useTls: null == useTls ? _self.useTls : useTls // ignore: cast_nullable_to_non_nullable
as bool,esclRoot: null == esclRoot ? _self.esclRoot : esclRoot // ignore: cast_nullable_to_non_nullable
as String,capabilities: freezed == capabilities ? _self.capabilities : capabilities // ignore: cast_nullable_to_non_nullable
as ScannerCapabilities?,
  ));
}
/// Create a copy of DiscoveredScanner
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ScannerCapabilitiesCopyWith<$Res>? get capabilities {
    if (_self.capabilities == null) {
    return null;
  }

  return $ScannerCapabilitiesCopyWith<$Res>(_self.capabilities!, (value) {
    return _then(_self.copyWith(capabilities: value));
  });
}
}


/// Adds pattern-matching-related methods to [DiscoveredScanner].
extension DiscoveredScannerPatterns on DiscoveredScanner {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DiscoveredScanner value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DiscoveredScanner() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DiscoveredScanner value)  $default,){
final _that = this;
switch (_that) {
case _DiscoveredScanner():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DiscoveredScanner value)?  $default,){
final _that = this;
switch (_that) {
case _DiscoveredScanner() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String displayName,  String host,  int port,  bool useTls,  String esclRoot,  ScannerCapabilities? capabilities)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DiscoveredScanner() when $default != null:
return $default(_that.id,_that.displayName,_that.host,_that.port,_that.useTls,_that.esclRoot,_that.capabilities);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String displayName,  String host,  int port,  bool useTls,  String esclRoot,  ScannerCapabilities? capabilities)  $default,) {final _that = this;
switch (_that) {
case _DiscoveredScanner():
return $default(_that.id,_that.displayName,_that.host,_that.port,_that.useTls,_that.esclRoot,_that.capabilities);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String displayName,  String host,  int port,  bool useTls,  String esclRoot,  ScannerCapabilities? capabilities)?  $default,) {final _that = this;
switch (_that) {
case _DiscoveredScanner() when $default != null:
return $default(_that.id,_that.displayName,_that.host,_that.port,_that.useTls,_that.esclRoot,_that.capabilities);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DiscoveredScanner implements DiscoveredScanner {
  const _DiscoveredScanner({required this.id, required this.displayName, required this.host, required this.port, required this.useTls, required this.esclRoot, this.capabilities});
  factory _DiscoveredScanner.fromJson(Map<String, dynamic> json) => _$DiscoveredScannerFromJson(json);

@override final  String id;
@override final  String displayName;
@override final  String host;
@override final  int port;
@override final  bool useTls;
@override final  String esclRoot;
@override final  ScannerCapabilities? capabilities;

/// Create a copy of DiscoveredScanner
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DiscoveredScannerCopyWith<_DiscoveredScanner> get copyWith => __$DiscoveredScannerCopyWithImpl<_DiscoveredScanner>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DiscoveredScannerToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DiscoveredScanner&&(identical(other.id, id) || other.id == id)&&(identical(other.displayName, displayName) || other.displayName == displayName)&&(identical(other.host, host) || other.host == host)&&(identical(other.port, port) || other.port == port)&&(identical(other.useTls, useTls) || other.useTls == useTls)&&(identical(other.esclRoot, esclRoot) || other.esclRoot == esclRoot)&&(identical(other.capabilities, capabilities) || other.capabilities == capabilities));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,displayName,host,port,useTls,esclRoot,capabilities);

@override
String toString() {
  return 'DiscoveredScanner(id: $id, displayName: $displayName, host: $host, port: $port, useTls: $useTls, esclRoot: $esclRoot, capabilities: $capabilities)';
}


}

/// @nodoc
abstract mixin class _$DiscoveredScannerCopyWith<$Res> implements $DiscoveredScannerCopyWith<$Res> {
  factory _$DiscoveredScannerCopyWith(_DiscoveredScanner value, $Res Function(_DiscoveredScanner) _then) = __$DiscoveredScannerCopyWithImpl;
@override @useResult
$Res call({
 String id, String displayName, String host, int port, bool useTls, String esclRoot, ScannerCapabilities? capabilities
});


@override $ScannerCapabilitiesCopyWith<$Res>? get capabilities;

}
/// @nodoc
class __$DiscoveredScannerCopyWithImpl<$Res>
    implements _$DiscoveredScannerCopyWith<$Res> {
  __$DiscoveredScannerCopyWithImpl(this._self, this._then);

  final _DiscoveredScanner _self;
  final $Res Function(_DiscoveredScanner) _then;

/// Create a copy of DiscoveredScanner
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? displayName = null,Object? host = null,Object? port = null,Object? useTls = null,Object? esclRoot = null,Object? capabilities = freezed,}) {
  return _then(_DiscoveredScanner(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,displayName: null == displayName ? _self.displayName : displayName // ignore: cast_nullable_to_non_nullable
as String,host: null == host ? _self.host : host // ignore: cast_nullable_to_non_nullable
as String,port: null == port ? _self.port : port // ignore: cast_nullable_to_non_nullable
as int,useTls: null == useTls ? _self.useTls : useTls // ignore: cast_nullable_to_non_nullable
as bool,esclRoot: null == esclRoot ? _self.esclRoot : esclRoot // ignore: cast_nullable_to_non_nullable
as String,capabilities: freezed == capabilities ? _self.capabilities : capabilities // ignore: cast_nullable_to_non_nullable
as ScannerCapabilities?,
  ));
}

/// Create a copy of DiscoveredScanner
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ScannerCapabilitiesCopyWith<$Res>? get capabilities {
    if (_self.capabilities == null) {
    return null;
  }

  return $ScannerCapabilitiesCopyWith<$Res>(_self.capabilities!, (value) {
    return _then(_self.copyWith(capabilities: value));
  });
}
}

// dart format on
