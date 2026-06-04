// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'server_config.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ServerConfig {

 String get id; String get displayName; String get baseUrl; AuthStrategyType get authType; bool get trustSelfSigned; Map<String, String>? get customHeaders;
/// Create a copy of ServerConfig
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ServerConfigCopyWith<ServerConfig> get copyWith => _$ServerConfigCopyWithImpl<ServerConfig>(this as ServerConfig, _$identity);

  /// Serializes this ServerConfig to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ServerConfig&&(identical(other.id, id) || other.id == id)&&(identical(other.displayName, displayName) || other.displayName == displayName)&&(identical(other.baseUrl, baseUrl) || other.baseUrl == baseUrl)&&(identical(other.authType, authType) || other.authType == authType)&&(identical(other.trustSelfSigned, trustSelfSigned) || other.trustSelfSigned == trustSelfSigned)&&const DeepCollectionEquality().equals(other.customHeaders, customHeaders));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,displayName,baseUrl,authType,trustSelfSigned,const DeepCollectionEquality().hash(customHeaders));

@override
String toString() {
  return 'ServerConfig(id: $id, displayName: $displayName, baseUrl: $baseUrl, authType: $authType, trustSelfSigned: $trustSelfSigned, customHeaders: $customHeaders)';
}


}

/// @nodoc
abstract mixin class $ServerConfigCopyWith<$Res>  {
  factory $ServerConfigCopyWith(ServerConfig value, $Res Function(ServerConfig) _then) = _$ServerConfigCopyWithImpl;
@useResult
$Res call({
 String id, String displayName, String baseUrl, AuthStrategyType authType, bool trustSelfSigned, Map<String, String>? customHeaders
});




}
/// @nodoc
class _$ServerConfigCopyWithImpl<$Res>
    implements $ServerConfigCopyWith<$Res> {
  _$ServerConfigCopyWithImpl(this._self, this._then);

  final ServerConfig _self;
  final $Res Function(ServerConfig) _then;

/// Create a copy of ServerConfig
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? displayName = null,Object? baseUrl = null,Object? authType = null,Object? trustSelfSigned = null,Object? customHeaders = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,displayName: null == displayName ? _self.displayName : displayName // ignore: cast_nullable_to_non_nullable
as String,baseUrl: null == baseUrl ? _self.baseUrl : baseUrl // ignore: cast_nullable_to_non_nullable
as String,authType: null == authType ? _self.authType : authType // ignore: cast_nullable_to_non_nullable
as AuthStrategyType,trustSelfSigned: null == trustSelfSigned ? _self.trustSelfSigned : trustSelfSigned // ignore: cast_nullable_to_non_nullable
as bool,customHeaders: freezed == customHeaders ? _self.customHeaders : customHeaders // ignore: cast_nullable_to_non_nullable
as Map<String, String>?,
  ));
}

}


/// Adds pattern-matching-related methods to [ServerConfig].
extension ServerConfigPatterns on ServerConfig {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ServerConfig value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ServerConfig() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ServerConfig value)  $default,){
final _that = this;
switch (_that) {
case _ServerConfig():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ServerConfig value)?  $default,){
final _that = this;
switch (_that) {
case _ServerConfig() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String displayName,  String baseUrl,  AuthStrategyType authType,  bool trustSelfSigned,  Map<String, String>? customHeaders)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ServerConfig() when $default != null:
return $default(_that.id,_that.displayName,_that.baseUrl,_that.authType,_that.trustSelfSigned,_that.customHeaders);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String displayName,  String baseUrl,  AuthStrategyType authType,  bool trustSelfSigned,  Map<String, String>? customHeaders)  $default,) {final _that = this;
switch (_that) {
case _ServerConfig():
return $default(_that.id,_that.displayName,_that.baseUrl,_that.authType,_that.trustSelfSigned,_that.customHeaders);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String displayName,  String baseUrl,  AuthStrategyType authType,  bool trustSelfSigned,  Map<String, String>? customHeaders)?  $default,) {final _that = this;
switch (_that) {
case _ServerConfig() when $default != null:
return $default(_that.id,_that.displayName,_that.baseUrl,_that.authType,_that.trustSelfSigned,_that.customHeaders);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ServerConfig implements ServerConfig {
  const _ServerConfig({required this.id, required this.displayName, required this.baseUrl, required this.authType, this.trustSelfSigned = false, final  Map<String, String>? customHeaders}): _customHeaders = customHeaders;
  factory _ServerConfig.fromJson(Map<String, dynamic> json) => _$ServerConfigFromJson(json);

@override final  String id;
@override final  String displayName;
@override final  String baseUrl;
@override final  AuthStrategyType authType;
@override@JsonKey() final  bool trustSelfSigned;
 final  Map<String, String>? _customHeaders;
@override Map<String, String>? get customHeaders {
  final value = _customHeaders;
  if (value == null) return null;
  if (_customHeaders is EqualUnmodifiableMapView) return _customHeaders;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(value);
}


/// Create a copy of ServerConfig
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ServerConfigCopyWith<_ServerConfig> get copyWith => __$ServerConfigCopyWithImpl<_ServerConfig>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ServerConfigToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ServerConfig&&(identical(other.id, id) || other.id == id)&&(identical(other.displayName, displayName) || other.displayName == displayName)&&(identical(other.baseUrl, baseUrl) || other.baseUrl == baseUrl)&&(identical(other.authType, authType) || other.authType == authType)&&(identical(other.trustSelfSigned, trustSelfSigned) || other.trustSelfSigned == trustSelfSigned)&&const DeepCollectionEquality().equals(other._customHeaders, _customHeaders));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,displayName,baseUrl,authType,trustSelfSigned,const DeepCollectionEquality().hash(_customHeaders));

@override
String toString() {
  return 'ServerConfig(id: $id, displayName: $displayName, baseUrl: $baseUrl, authType: $authType, trustSelfSigned: $trustSelfSigned, customHeaders: $customHeaders)';
}


}

/// @nodoc
abstract mixin class _$ServerConfigCopyWith<$Res> implements $ServerConfigCopyWith<$Res> {
  factory _$ServerConfigCopyWith(_ServerConfig value, $Res Function(_ServerConfig) _then) = __$ServerConfigCopyWithImpl;
@override @useResult
$Res call({
 String id, String displayName, String baseUrl, AuthStrategyType authType, bool trustSelfSigned, Map<String, String>? customHeaders
});




}
/// @nodoc
class __$ServerConfigCopyWithImpl<$Res>
    implements _$ServerConfigCopyWith<$Res> {
  __$ServerConfigCopyWithImpl(this._self, this._then);

  final _ServerConfig _self;
  final $Res Function(_ServerConfig) _then;

/// Create a copy of ServerConfig
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? displayName = null,Object? baseUrl = null,Object? authType = null,Object? trustSelfSigned = null,Object? customHeaders = freezed,}) {
  return _then(_ServerConfig(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,displayName: null == displayName ? _self.displayName : displayName // ignore: cast_nullable_to_non_nullable
as String,baseUrl: null == baseUrl ? _self.baseUrl : baseUrl // ignore: cast_nullable_to_non_nullable
as String,authType: null == authType ? _self.authType : authType // ignore: cast_nullable_to_non_nullable
as AuthStrategyType,trustSelfSigned: null == trustSelfSigned ? _self.trustSelfSigned : trustSelfSigned // ignore: cast_nullable_to_non_nullable
as bool,customHeaders: freezed == customHeaders ? _self._customHeaders : customHeaders // ignore: cast_nullable_to_non_nullable
as Map<String, String>?,
  ));
}


}

// dart format on
