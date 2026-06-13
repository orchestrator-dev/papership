// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'correspondent_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CorrespondentDto {

 int get id; String get name; String get slug; String get match;@JsonKey(name: 'matching_algorithm') int get matchingAlgorithm;@JsonKey(name: 'is_insensitive') bool get isInsensitive;@JsonKey(name: 'last_correspondence') String? get lastCorrespondence;
/// Create a copy of CorrespondentDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CorrespondentDtoCopyWith<CorrespondentDto> get copyWith => _$CorrespondentDtoCopyWithImpl<CorrespondentDto>(this as CorrespondentDto, _$identity);

  /// Serializes this CorrespondentDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CorrespondentDto&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.slug, slug) || other.slug == slug)&&(identical(other.match, match) || other.match == match)&&(identical(other.matchingAlgorithm, matchingAlgorithm) || other.matchingAlgorithm == matchingAlgorithm)&&(identical(other.isInsensitive, isInsensitive) || other.isInsensitive == isInsensitive)&&(identical(other.lastCorrespondence, lastCorrespondence) || other.lastCorrespondence == lastCorrespondence));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,slug,match,matchingAlgorithm,isInsensitive,lastCorrespondence);

@override
String toString() {
  return 'CorrespondentDto(id: $id, name: $name, slug: $slug, match: $match, matchingAlgorithm: $matchingAlgorithm, isInsensitive: $isInsensitive, lastCorrespondence: $lastCorrespondence)';
}


}

/// @nodoc
abstract mixin class $CorrespondentDtoCopyWith<$Res>  {
  factory $CorrespondentDtoCopyWith(CorrespondentDto value, $Res Function(CorrespondentDto) _then) = _$CorrespondentDtoCopyWithImpl;
@useResult
$Res call({
 int id, String name, String slug, String match,@JsonKey(name: 'matching_algorithm') int matchingAlgorithm,@JsonKey(name: 'is_insensitive') bool isInsensitive,@JsonKey(name: 'last_correspondence') String? lastCorrespondence
});




}
/// @nodoc
class _$CorrespondentDtoCopyWithImpl<$Res>
    implements $CorrespondentDtoCopyWith<$Res> {
  _$CorrespondentDtoCopyWithImpl(this._self, this._then);

  final CorrespondentDto _self;
  final $Res Function(CorrespondentDto) _then;

/// Create a copy of CorrespondentDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? slug = null,Object? match = null,Object? matchingAlgorithm = null,Object? isInsensitive = null,Object? lastCorrespondence = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,slug: null == slug ? _self.slug : slug // ignore: cast_nullable_to_non_nullable
as String,match: null == match ? _self.match : match // ignore: cast_nullable_to_non_nullable
as String,matchingAlgorithm: null == matchingAlgorithm ? _self.matchingAlgorithm : matchingAlgorithm // ignore: cast_nullable_to_non_nullable
as int,isInsensitive: null == isInsensitive ? _self.isInsensitive : isInsensitive // ignore: cast_nullable_to_non_nullable
as bool,lastCorrespondence: freezed == lastCorrespondence ? _self.lastCorrespondence : lastCorrespondence // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [CorrespondentDto].
extension CorrespondentDtoPatterns on CorrespondentDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CorrespondentDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CorrespondentDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CorrespondentDto value)  $default,){
final _that = this;
switch (_that) {
case _CorrespondentDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CorrespondentDto value)?  $default,){
final _that = this;
switch (_that) {
case _CorrespondentDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String name,  String slug,  String match, @JsonKey(name: 'matching_algorithm')  int matchingAlgorithm, @JsonKey(name: 'is_insensitive')  bool isInsensitive, @JsonKey(name: 'last_correspondence')  String? lastCorrespondence)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CorrespondentDto() when $default != null:
return $default(_that.id,_that.name,_that.slug,_that.match,_that.matchingAlgorithm,_that.isInsensitive,_that.lastCorrespondence);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String name,  String slug,  String match, @JsonKey(name: 'matching_algorithm')  int matchingAlgorithm, @JsonKey(name: 'is_insensitive')  bool isInsensitive, @JsonKey(name: 'last_correspondence')  String? lastCorrespondence)  $default,) {final _that = this;
switch (_that) {
case _CorrespondentDto():
return $default(_that.id,_that.name,_that.slug,_that.match,_that.matchingAlgorithm,_that.isInsensitive,_that.lastCorrespondence);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String name,  String slug,  String match, @JsonKey(name: 'matching_algorithm')  int matchingAlgorithm, @JsonKey(name: 'is_insensitive')  bool isInsensitive, @JsonKey(name: 'last_correspondence')  String? lastCorrespondence)?  $default,) {final _that = this;
switch (_that) {
case _CorrespondentDto() when $default != null:
return $default(_that.id,_that.name,_that.slug,_that.match,_that.matchingAlgorithm,_that.isInsensitive,_that.lastCorrespondence);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CorrespondentDto implements CorrespondentDto {
  const _CorrespondentDto({required this.id, required this.name, required this.slug, required this.match, @JsonKey(name: 'matching_algorithm') required this.matchingAlgorithm, @JsonKey(name: 'is_insensitive') required this.isInsensitive, @JsonKey(name: 'last_correspondence') this.lastCorrespondence});
  factory _CorrespondentDto.fromJson(Map<String, dynamic> json) => _$CorrespondentDtoFromJson(json);

@override final  int id;
@override final  String name;
@override final  String slug;
@override final  String match;
@override@JsonKey(name: 'matching_algorithm') final  int matchingAlgorithm;
@override@JsonKey(name: 'is_insensitive') final  bool isInsensitive;
@override@JsonKey(name: 'last_correspondence') final  String? lastCorrespondence;

/// Create a copy of CorrespondentDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CorrespondentDtoCopyWith<_CorrespondentDto> get copyWith => __$CorrespondentDtoCopyWithImpl<_CorrespondentDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CorrespondentDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CorrespondentDto&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.slug, slug) || other.slug == slug)&&(identical(other.match, match) || other.match == match)&&(identical(other.matchingAlgorithm, matchingAlgorithm) || other.matchingAlgorithm == matchingAlgorithm)&&(identical(other.isInsensitive, isInsensitive) || other.isInsensitive == isInsensitive)&&(identical(other.lastCorrespondence, lastCorrespondence) || other.lastCorrespondence == lastCorrespondence));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,slug,match,matchingAlgorithm,isInsensitive,lastCorrespondence);

@override
String toString() {
  return 'CorrespondentDto(id: $id, name: $name, slug: $slug, match: $match, matchingAlgorithm: $matchingAlgorithm, isInsensitive: $isInsensitive, lastCorrespondence: $lastCorrespondence)';
}


}

/// @nodoc
abstract mixin class _$CorrespondentDtoCopyWith<$Res> implements $CorrespondentDtoCopyWith<$Res> {
  factory _$CorrespondentDtoCopyWith(_CorrespondentDto value, $Res Function(_CorrespondentDto) _then) = __$CorrespondentDtoCopyWithImpl;
@override @useResult
$Res call({
 int id, String name, String slug, String match,@JsonKey(name: 'matching_algorithm') int matchingAlgorithm,@JsonKey(name: 'is_insensitive') bool isInsensitive,@JsonKey(name: 'last_correspondence') String? lastCorrespondence
});




}
/// @nodoc
class __$CorrespondentDtoCopyWithImpl<$Res>
    implements _$CorrespondentDtoCopyWith<$Res> {
  __$CorrespondentDtoCopyWithImpl(this._self, this._then);

  final _CorrespondentDto _self;
  final $Res Function(_CorrespondentDto) _then;

/// Create a copy of CorrespondentDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? slug = null,Object? match = null,Object? matchingAlgorithm = null,Object? isInsensitive = null,Object? lastCorrespondence = freezed,}) {
  return _then(_CorrespondentDto(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,slug: null == slug ? _self.slug : slug // ignore: cast_nullable_to_non_nullable
as String,match: null == match ? _self.match : match // ignore: cast_nullable_to_non_nullable
as String,matchingAlgorithm: null == matchingAlgorithm ? _self.matchingAlgorithm : matchingAlgorithm // ignore: cast_nullable_to_non_nullable
as int,isInsensitive: null == isInsensitive ? _self.isInsensitive : isInsensitive // ignore: cast_nullable_to_non_nullable
as bool,lastCorrespondence: freezed == lastCorrespondence ? _self.lastCorrespondence : lastCorrespondence // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
