// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_credentials.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AuthCredentials {

 String? get serverId; String? get baseUrl; String? get token; String? get refreshToken; String? get username; String? get password; Map<String, String>? get customHeaders; String? get certificateBase64; String? get oidcDiscoveryUrl; String? get oidcClientId;
/// Create a copy of AuthCredentials
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AuthCredentialsCopyWith<AuthCredentials> get copyWith => _$AuthCredentialsCopyWithImpl<AuthCredentials>(this as AuthCredentials, _$identity);

  /// Serializes this AuthCredentials to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthCredentials&&(identical(other.serverId, serverId) || other.serverId == serverId)&&(identical(other.baseUrl, baseUrl) || other.baseUrl == baseUrl)&&(identical(other.token, token) || other.token == token)&&(identical(other.refreshToken, refreshToken) || other.refreshToken == refreshToken)&&(identical(other.username, username) || other.username == username)&&(identical(other.password, password) || other.password == password)&&const DeepCollectionEquality().equals(other.customHeaders, customHeaders)&&(identical(other.certificateBase64, certificateBase64) || other.certificateBase64 == certificateBase64)&&(identical(other.oidcDiscoveryUrl, oidcDiscoveryUrl) || other.oidcDiscoveryUrl == oidcDiscoveryUrl)&&(identical(other.oidcClientId, oidcClientId) || other.oidcClientId == oidcClientId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,serverId,baseUrl,token,refreshToken,username,password,const DeepCollectionEquality().hash(customHeaders),certificateBase64,oidcDiscoveryUrl,oidcClientId);

@override
String toString() {
  return 'AuthCredentials(serverId: $serverId, baseUrl: $baseUrl, token: $token, refreshToken: $refreshToken, username: $username, password: $password, customHeaders: $customHeaders, certificateBase64: $certificateBase64, oidcDiscoveryUrl: $oidcDiscoveryUrl, oidcClientId: $oidcClientId)';
}


}

/// @nodoc
abstract mixin class $AuthCredentialsCopyWith<$Res>  {
  factory $AuthCredentialsCopyWith(AuthCredentials value, $Res Function(AuthCredentials) _then) = _$AuthCredentialsCopyWithImpl;
@useResult
$Res call({
 String? serverId, String? baseUrl, String? token, String? refreshToken, String? username, String? password, Map<String, String>? customHeaders, String? certificateBase64, String? oidcDiscoveryUrl, String? oidcClientId
});




}
/// @nodoc
class _$AuthCredentialsCopyWithImpl<$Res>
    implements $AuthCredentialsCopyWith<$Res> {
  _$AuthCredentialsCopyWithImpl(this._self, this._then);

  final AuthCredentials _self;
  final $Res Function(AuthCredentials) _then;

/// Create a copy of AuthCredentials
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? serverId = freezed,Object? baseUrl = freezed,Object? token = freezed,Object? refreshToken = freezed,Object? username = freezed,Object? password = freezed,Object? customHeaders = freezed,Object? certificateBase64 = freezed,Object? oidcDiscoveryUrl = freezed,Object? oidcClientId = freezed,}) {
  return _then(_self.copyWith(
serverId: freezed == serverId ? _self.serverId : serverId // ignore: cast_nullable_to_non_nullable
as String?,baseUrl: freezed == baseUrl ? _self.baseUrl : baseUrl // ignore: cast_nullable_to_non_nullable
as String?,token: freezed == token ? _self.token : token // ignore: cast_nullable_to_non_nullable
as String?,refreshToken: freezed == refreshToken ? _self.refreshToken : refreshToken // ignore: cast_nullable_to_non_nullable
as String?,username: freezed == username ? _self.username : username // ignore: cast_nullable_to_non_nullable
as String?,password: freezed == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as String?,customHeaders: freezed == customHeaders ? _self.customHeaders : customHeaders // ignore: cast_nullable_to_non_nullable
as Map<String, String>?,certificateBase64: freezed == certificateBase64 ? _self.certificateBase64 : certificateBase64 // ignore: cast_nullable_to_non_nullable
as String?,oidcDiscoveryUrl: freezed == oidcDiscoveryUrl ? _self.oidcDiscoveryUrl : oidcDiscoveryUrl // ignore: cast_nullable_to_non_nullable
as String?,oidcClientId: freezed == oidcClientId ? _self.oidcClientId : oidcClientId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [AuthCredentials].
extension AuthCredentialsPatterns on AuthCredentials {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AuthCredentials value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AuthCredentials() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AuthCredentials value)  $default,){
final _that = this;
switch (_that) {
case _AuthCredentials():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AuthCredentials value)?  $default,){
final _that = this;
switch (_that) {
case _AuthCredentials() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? serverId,  String? baseUrl,  String? token,  String? refreshToken,  String? username,  String? password,  Map<String, String>? customHeaders,  String? certificateBase64,  String? oidcDiscoveryUrl,  String? oidcClientId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AuthCredentials() when $default != null:
return $default(_that.serverId,_that.baseUrl,_that.token,_that.refreshToken,_that.username,_that.password,_that.customHeaders,_that.certificateBase64,_that.oidcDiscoveryUrl,_that.oidcClientId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? serverId,  String? baseUrl,  String? token,  String? refreshToken,  String? username,  String? password,  Map<String, String>? customHeaders,  String? certificateBase64,  String? oidcDiscoveryUrl,  String? oidcClientId)  $default,) {final _that = this;
switch (_that) {
case _AuthCredentials():
return $default(_that.serverId,_that.baseUrl,_that.token,_that.refreshToken,_that.username,_that.password,_that.customHeaders,_that.certificateBase64,_that.oidcDiscoveryUrl,_that.oidcClientId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? serverId,  String? baseUrl,  String? token,  String? refreshToken,  String? username,  String? password,  Map<String, String>? customHeaders,  String? certificateBase64,  String? oidcDiscoveryUrl,  String? oidcClientId)?  $default,) {final _that = this;
switch (_that) {
case _AuthCredentials() when $default != null:
return $default(_that.serverId,_that.baseUrl,_that.token,_that.refreshToken,_that.username,_that.password,_that.customHeaders,_that.certificateBase64,_that.oidcDiscoveryUrl,_that.oidcClientId);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AuthCredentials implements AuthCredentials {
  const _AuthCredentials({this.serverId, this.baseUrl, this.token, this.refreshToken, this.username, this.password, final  Map<String, String>? customHeaders, this.certificateBase64, this.oidcDiscoveryUrl, this.oidcClientId}): _customHeaders = customHeaders;
  factory _AuthCredentials.fromJson(Map<String, dynamic> json) => _$AuthCredentialsFromJson(json);

@override final  String? serverId;
@override final  String? baseUrl;
@override final  String? token;
@override final  String? refreshToken;
@override final  String? username;
@override final  String? password;
 final  Map<String, String>? _customHeaders;
@override Map<String, String>? get customHeaders {
  final value = _customHeaders;
  if (value == null) return null;
  if (_customHeaders is EqualUnmodifiableMapView) return _customHeaders;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(value);
}

@override final  String? certificateBase64;
@override final  String? oidcDiscoveryUrl;
@override final  String? oidcClientId;

/// Create a copy of AuthCredentials
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AuthCredentialsCopyWith<_AuthCredentials> get copyWith => __$AuthCredentialsCopyWithImpl<_AuthCredentials>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AuthCredentialsToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AuthCredentials&&(identical(other.serverId, serverId) || other.serverId == serverId)&&(identical(other.baseUrl, baseUrl) || other.baseUrl == baseUrl)&&(identical(other.token, token) || other.token == token)&&(identical(other.refreshToken, refreshToken) || other.refreshToken == refreshToken)&&(identical(other.username, username) || other.username == username)&&(identical(other.password, password) || other.password == password)&&const DeepCollectionEquality().equals(other._customHeaders, _customHeaders)&&(identical(other.certificateBase64, certificateBase64) || other.certificateBase64 == certificateBase64)&&(identical(other.oidcDiscoveryUrl, oidcDiscoveryUrl) || other.oidcDiscoveryUrl == oidcDiscoveryUrl)&&(identical(other.oidcClientId, oidcClientId) || other.oidcClientId == oidcClientId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,serverId,baseUrl,token,refreshToken,username,password,const DeepCollectionEquality().hash(_customHeaders),certificateBase64,oidcDiscoveryUrl,oidcClientId);

@override
String toString() {
  return 'AuthCredentials(serverId: $serverId, baseUrl: $baseUrl, token: $token, refreshToken: $refreshToken, username: $username, password: $password, customHeaders: $customHeaders, certificateBase64: $certificateBase64, oidcDiscoveryUrl: $oidcDiscoveryUrl, oidcClientId: $oidcClientId)';
}


}

/// @nodoc
abstract mixin class _$AuthCredentialsCopyWith<$Res> implements $AuthCredentialsCopyWith<$Res> {
  factory _$AuthCredentialsCopyWith(_AuthCredentials value, $Res Function(_AuthCredentials) _then) = __$AuthCredentialsCopyWithImpl;
@override @useResult
$Res call({
 String? serverId, String? baseUrl, String? token, String? refreshToken, String? username, String? password, Map<String, String>? customHeaders, String? certificateBase64, String? oidcDiscoveryUrl, String? oidcClientId
});




}
/// @nodoc
class __$AuthCredentialsCopyWithImpl<$Res>
    implements _$AuthCredentialsCopyWith<$Res> {
  __$AuthCredentialsCopyWithImpl(this._self, this._then);

  final _AuthCredentials _self;
  final $Res Function(_AuthCredentials) _then;

/// Create a copy of AuthCredentials
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? serverId = freezed,Object? baseUrl = freezed,Object? token = freezed,Object? refreshToken = freezed,Object? username = freezed,Object? password = freezed,Object? customHeaders = freezed,Object? certificateBase64 = freezed,Object? oidcDiscoveryUrl = freezed,Object? oidcClientId = freezed,}) {
  return _then(_AuthCredentials(
serverId: freezed == serverId ? _self.serverId : serverId // ignore: cast_nullable_to_non_nullable
as String?,baseUrl: freezed == baseUrl ? _self.baseUrl : baseUrl // ignore: cast_nullable_to_non_nullable
as String?,token: freezed == token ? _self.token : token // ignore: cast_nullable_to_non_nullable
as String?,refreshToken: freezed == refreshToken ? _self.refreshToken : refreshToken // ignore: cast_nullable_to_non_nullable
as String?,username: freezed == username ? _self.username : username // ignore: cast_nullable_to_non_nullable
as String?,password: freezed == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as String?,customHeaders: freezed == customHeaders ? _self._customHeaders : customHeaders // ignore: cast_nullable_to_non_nullable
as Map<String, String>?,certificateBase64: freezed == certificateBase64 ? _self.certificateBase64 : certificateBase64 // ignore: cast_nullable_to_non_nullable
as String?,oidcDiscoveryUrl: freezed == oidcDiscoveryUrl ? _self.oidcDiscoveryUrl : oidcDiscoveryUrl // ignore: cast_nullable_to_non_nullable
as String?,oidcClientId: freezed == oidcClientId ? _self.oidcClientId : oidcClientId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
