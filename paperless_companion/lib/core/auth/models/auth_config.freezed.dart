// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_config.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AuthConfig {

 String get serverId; String get baseUrl; String? get username; String? get password; String? get token;
/// Create a copy of AuthConfig
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AuthConfigCopyWith<AuthConfig> get copyWith => _$AuthConfigCopyWithImpl<AuthConfig>(this as AuthConfig, _$identity);

  /// Serializes this AuthConfig to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthConfig&&(identical(other.serverId, serverId) || other.serverId == serverId)&&(identical(other.baseUrl, baseUrl) || other.baseUrl == baseUrl)&&(identical(other.username, username) || other.username == username)&&(identical(other.password, password) || other.password == password)&&(identical(other.token, token) || other.token == token));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,serverId,baseUrl,username,password,token);

@override
String toString() {
  return 'AuthConfig(serverId: $serverId, baseUrl: $baseUrl, username: $username, password: $password, token: $token)';
}


}

/// @nodoc
abstract mixin class $AuthConfigCopyWith<$Res>  {
  factory $AuthConfigCopyWith(AuthConfig value, $Res Function(AuthConfig) _then) = _$AuthConfigCopyWithImpl;
@useResult
$Res call({
 String serverId, String baseUrl, String? username, String? password, String? token
});




}
/// @nodoc
class _$AuthConfigCopyWithImpl<$Res>
    implements $AuthConfigCopyWith<$Res> {
  _$AuthConfigCopyWithImpl(this._self, this._then);

  final AuthConfig _self;
  final $Res Function(AuthConfig) _then;

/// Create a copy of AuthConfig
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? serverId = null,Object? baseUrl = null,Object? username = freezed,Object? password = freezed,Object? token = freezed,}) {
  return _then(_self.copyWith(
serverId: null == serverId ? _self.serverId : serverId // ignore: cast_nullable_to_non_nullable
as String,baseUrl: null == baseUrl ? _self.baseUrl : baseUrl // ignore: cast_nullable_to_non_nullable
as String,username: freezed == username ? _self.username : username // ignore: cast_nullable_to_non_nullable
as String?,password: freezed == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as String?,token: freezed == token ? _self.token : token // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [AuthConfig].
extension AuthConfigPatterns on AuthConfig {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AuthConfig value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AuthConfig() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AuthConfig value)  $default,){
final _that = this;
switch (_that) {
case _AuthConfig():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AuthConfig value)?  $default,){
final _that = this;
switch (_that) {
case _AuthConfig() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String serverId,  String baseUrl,  String? username,  String? password,  String? token)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AuthConfig() when $default != null:
return $default(_that.serverId,_that.baseUrl,_that.username,_that.password,_that.token);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String serverId,  String baseUrl,  String? username,  String? password,  String? token)  $default,) {final _that = this;
switch (_that) {
case _AuthConfig():
return $default(_that.serverId,_that.baseUrl,_that.username,_that.password,_that.token);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String serverId,  String baseUrl,  String? username,  String? password,  String? token)?  $default,) {final _that = this;
switch (_that) {
case _AuthConfig() when $default != null:
return $default(_that.serverId,_that.baseUrl,_that.username,_that.password,_that.token);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AuthConfig implements AuthConfig {
  const _AuthConfig({required this.serverId, required this.baseUrl, this.username, this.password, this.token});
  factory _AuthConfig.fromJson(Map<String, dynamic> json) => _$AuthConfigFromJson(json);

@override final  String serverId;
@override final  String baseUrl;
@override final  String? username;
@override final  String? password;
@override final  String? token;

/// Create a copy of AuthConfig
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AuthConfigCopyWith<_AuthConfig> get copyWith => __$AuthConfigCopyWithImpl<_AuthConfig>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AuthConfigToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AuthConfig&&(identical(other.serverId, serverId) || other.serverId == serverId)&&(identical(other.baseUrl, baseUrl) || other.baseUrl == baseUrl)&&(identical(other.username, username) || other.username == username)&&(identical(other.password, password) || other.password == password)&&(identical(other.token, token) || other.token == token));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,serverId,baseUrl,username,password,token);

@override
String toString() {
  return 'AuthConfig(serverId: $serverId, baseUrl: $baseUrl, username: $username, password: $password, token: $token)';
}


}

/// @nodoc
abstract mixin class _$AuthConfigCopyWith<$Res> implements $AuthConfigCopyWith<$Res> {
  factory _$AuthConfigCopyWith(_AuthConfig value, $Res Function(_AuthConfig) _then) = __$AuthConfigCopyWithImpl;
@override @useResult
$Res call({
 String serverId, String baseUrl, String? username, String? password, String? token
});




}
/// @nodoc
class __$AuthConfigCopyWithImpl<$Res>
    implements _$AuthConfigCopyWith<$Res> {
  __$AuthConfigCopyWithImpl(this._self, this._then);

  final _AuthConfig _self;
  final $Res Function(_AuthConfig) _then;

/// Create a copy of AuthConfig
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? serverId = null,Object? baseUrl = null,Object? username = freezed,Object? password = freezed,Object? token = freezed,}) {
  return _then(_AuthConfig(
serverId: null == serverId ? _self.serverId : serverId // ignore: cast_nullable_to_non_nullable
as String,baseUrl: null == baseUrl ? _self.baseUrl : baseUrl // ignore: cast_nullable_to_non_nullable
as String,username: freezed == username ? _self.username : username // ignore: cast_nullable_to_non_nullable
as String?,password: freezed == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as String?,token: freezed == token ? _self.token : token // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
