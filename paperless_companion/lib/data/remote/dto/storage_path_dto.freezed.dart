// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'storage_path_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$StoragePathDto {

 int get id; String get name; String get slug; String get path; String get match;@JsonKey(name: 'matching_algorithm') int get matchingAlgorithm;@JsonKey(name: 'is_insensitive') bool get isInsensitive;
/// Create a copy of StoragePathDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$StoragePathDtoCopyWith<StoragePathDto> get copyWith => _$StoragePathDtoCopyWithImpl<StoragePathDto>(this as StoragePathDto, _$identity);

  /// Serializes this StoragePathDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StoragePathDto&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.slug, slug) || other.slug == slug)&&(identical(other.path, path) || other.path == path)&&(identical(other.match, match) || other.match == match)&&(identical(other.matchingAlgorithm, matchingAlgorithm) || other.matchingAlgorithm == matchingAlgorithm)&&(identical(other.isInsensitive, isInsensitive) || other.isInsensitive == isInsensitive));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,slug,path,match,matchingAlgorithm,isInsensitive);

@override
String toString() {
  return 'StoragePathDto(id: $id, name: $name, slug: $slug, path: $path, match: $match, matchingAlgorithm: $matchingAlgorithm, isInsensitive: $isInsensitive)';
}


}

/// @nodoc
abstract mixin class $StoragePathDtoCopyWith<$Res>  {
  factory $StoragePathDtoCopyWith(StoragePathDto value, $Res Function(StoragePathDto) _then) = _$StoragePathDtoCopyWithImpl;
@useResult
$Res call({
 int id, String name, String slug, String path, String match,@JsonKey(name: 'matching_algorithm') int matchingAlgorithm,@JsonKey(name: 'is_insensitive') bool isInsensitive
});




}
/// @nodoc
class _$StoragePathDtoCopyWithImpl<$Res>
    implements $StoragePathDtoCopyWith<$Res> {
  _$StoragePathDtoCopyWithImpl(this._self, this._then);

  final StoragePathDto _self;
  final $Res Function(StoragePathDto) _then;

/// Create a copy of StoragePathDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? slug = null,Object? path = null,Object? match = null,Object? matchingAlgorithm = null,Object? isInsensitive = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,slug: null == slug ? _self.slug : slug // ignore: cast_nullable_to_non_nullable
as String,path: null == path ? _self.path : path // ignore: cast_nullable_to_non_nullable
as String,match: null == match ? _self.match : match // ignore: cast_nullable_to_non_nullable
as String,matchingAlgorithm: null == matchingAlgorithm ? _self.matchingAlgorithm : matchingAlgorithm // ignore: cast_nullable_to_non_nullable
as int,isInsensitive: null == isInsensitive ? _self.isInsensitive : isInsensitive // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [StoragePathDto].
extension StoragePathDtoPatterns on StoragePathDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _StoragePathDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _StoragePathDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _StoragePathDto value)  $default,){
final _that = this;
switch (_that) {
case _StoragePathDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _StoragePathDto value)?  $default,){
final _that = this;
switch (_that) {
case _StoragePathDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String name,  String slug,  String path,  String match, @JsonKey(name: 'matching_algorithm')  int matchingAlgorithm, @JsonKey(name: 'is_insensitive')  bool isInsensitive)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _StoragePathDto() when $default != null:
return $default(_that.id,_that.name,_that.slug,_that.path,_that.match,_that.matchingAlgorithm,_that.isInsensitive);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String name,  String slug,  String path,  String match, @JsonKey(name: 'matching_algorithm')  int matchingAlgorithm, @JsonKey(name: 'is_insensitive')  bool isInsensitive)  $default,) {final _that = this;
switch (_that) {
case _StoragePathDto():
return $default(_that.id,_that.name,_that.slug,_that.path,_that.match,_that.matchingAlgorithm,_that.isInsensitive);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String name,  String slug,  String path,  String match, @JsonKey(name: 'matching_algorithm')  int matchingAlgorithm, @JsonKey(name: 'is_insensitive')  bool isInsensitive)?  $default,) {final _that = this;
switch (_that) {
case _StoragePathDto() when $default != null:
return $default(_that.id,_that.name,_that.slug,_that.path,_that.match,_that.matchingAlgorithm,_that.isInsensitive);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _StoragePathDto implements StoragePathDto {
  const _StoragePathDto({required this.id, required this.name, required this.slug, required this.path, required this.match, @JsonKey(name: 'matching_algorithm') required this.matchingAlgorithm, @JsonKey(name: 'is_insensitive') required this.isInsensitive});
  factory _StoragePathDto.fromJson(Map<String, dynamic> json) => _$StoragePathDtoFromJson(json);

@override final  int id;
@override final  String name;
@override final  String slug;
@override final  String path;
@override final  String match;
@override@JsonKey(name: 'matching_algorithm') final  int matchingAlgorithm;
@override@JsonKey(name: 'is_insensitive') final  bool isInsensitive;

/// Create a copy of StoragePathDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StoragePathDtoCopyWith<_StoragePathDto> get copyWith => __$StoragePathDtoCopyWithImpl<_StoragePathDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$StoragePathDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _StoragePathDto&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.slug, slug) || other.slug == slug)&&(identical(other.path, path) || other.path == path)&&(identical(other.match, match) || other.match == match)&&(identical(other.matchingAlgorithm, matchingAlgorithm) || other.matchingAlgorithm == matchingAlgorithm)&&(identical(other.isInsensitive, isInsensitive) || other.isInsensitive == isInsensitive));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,slug,path,match,matchingAlgorithm,isInsensitive);

@override
String toString() {
  return 'StoragePathDto(id: $id, name: $name, slug: $slug, path: $path, match: $match, matchingAlgorithm: $matchingAlgorithm, isInsensitive: $isInsensitive)';
}


}

/// @nodoc
abstract mixin class _$StoragePathDtoCopyWith<$Res> implements $StoragePathDtoCopyWith<$Res> {
  factory _$StoragePathDtoCopyWith(_StoragePathDto value, $Res Function(_StoragePathDto) _then) = __$StoragePathDtoCopyWithImpl;
@override @useResult
$Res call({
 int id, String name, String slug, String path, String match,@JsonKey(name: 'matching_algorithm') int matchingAlgorithm,@JsonKey(name: 'is_insensitive') bool isInsensitive
});




}
/// @nodoc
class __$StoragePathDtoCopyWithImpl<$Res>
    implements _$StoragePathDtoCopyWith<$Res> {
  __$StoragePathDtoCopyWithImpl(this._self, this._then);

  final _StoragePathDto _self;
  final $Res Function(_StoragePathDto) _then;

/// Create a copy of StoragePathDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? slug = null,Object? path = null,Object? match = null,Object? matchingAlgorithm = null,Object? isInsensitive = null,}) {
  return _then(_StoragePathDto(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,slug: null == slug ? _self.slug : slug // ignore: cast_nullable_to_non_nullable
as String,path: null == path ? _self.path : path // ignore: cast_nullable_to_non_nullable
as String,match: null == match ? _self.match : match // ignore: cast_nullable_to_non_nullable
as String,matchingAlgorithm: null == matchingAlgorithm ? _self.matchingAlgorithm : matchingAlgorithm // ignore: cast_nullable_to_non_nullable
as int,isInsensitive: null == isInsensitive ? _self.isInsensitive : isInsensitive // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
