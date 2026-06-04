// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tag_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TagDto {

 int get id; String get name; String get slug; String get color;@JsonKey(name: 'text_color') String get textColor;@JsonKey(name: 'match') String get match;@JsonKey(name: 'matching_algorithm') int get matchingAlgorithm;@JsonKey(name: 'is_insensitive') bool get isInsensitive;@JsonKey(name: 'is_inbox_tag') bool get isInboxTag;
/// Create a copy of TagDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TagDtoCopyWith<TagDto> get copyWith => _$TagDtoCopyWithImpl<TagDto>(this as TagDto, _$identity);

  /// Serializes this TagDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TagDto&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.slug, slug) || other.slug == slug)&&(identical(other.color, color) || other.color == color)&&(identical(other.textColor, textColor) || other.textColor == textColor)&&(identical(other.match, match) || other.match == match)&&(identical(other.matchingAlgorithm, matchingAlgorithm) || other.matchingAlgorithm == matchingAlgorithm)&&(identical(other.isInsensitive, isInsensitive) || other.isInsensitive == isInsensitive)&&(identical(other.isInboxTag, isInboxTag) || other.isInboxTag == isInboxTag));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,slug,color,textColor,match,matchingAlgorithm,isInsensitive,isInboxTag);

@override
String toString() {
  return 'TagDto(id: $id, name: $name, slug: $slug, color: $color, textColor: $textColor, match: $match, matchingAlgorithm: $matchingAlgorithm, isInsensitive: $isInsensitive, isInboxTag: $isInboxTag)';
}


}

/// @nodoc
abstract mixin class $TagDtoCopyWith<$Res>  {
  factory $TagDtoCopyWith(TagDto value, $Res Function(TagDto) _then) = _$TagDtoCopyWithImpl;
@useResult
$Res call({
 int id, String name, String slug, String color,@JsonKey(name: 'text_color') String textColor,@JsonKey(name: 'match') String match,@JsonKey(name: 'matching_algorithm') int matchingAlgorithm,@JsonKey(name: 'is_insensitive') bool isInsensitive,@JsonKey(name: 'is_inbox_tag') bool isInboxTag
});




}
/// @nodoc
class _$TagDtoCopyWithImpl<$Res>
    implements $TagDtoCopyWith<$Res> {
  _$TagDtoCopyWithImpl(this._self, this._then);

  final TagDto _self;
  final $Res Function(TagDto) _then;

/// Create a copy of TagDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? slug = null,Object? color = null,Object? textColor = null,Object? match = null,Object? matchingAlgorithm = null,Object? isInsensitive = null,Object? isInboxTag = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,slug: null == slug ? _self.slug : slug // ignore: cast_nullable_to_non_nullable
as String,color: null == color ? _self.color : color // ignore: cast_nullable_to_non_nullable
as String,textColor: null == textColor ? _self.textColor : textColor // ignore: cast_nullable_to_non_nullable
as String,match: null == match ? _self.match : match // ignore: cast_nullable_to_non_nullable
as String,matchingAlgorithm: null == matchingAlgorithm ? _self.matchingAlgorithm : matchingAlgorithm // ignore: cast_nullable_to_non_nullable
as int,isInsensitive: null == isInsensitive ? _self.isInsensitive : isInsensitive // ignore: cast_nullable_to_non_nullable
as bool,isInboxTag: null == isInboxTag ? _self.isInboxTag : isInboxTag // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [TagDto].
extension TagDtoPatterns on TagDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TagDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TagDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TagDto value)  $default,){
final _that = this;
switch (_that) {
case _TagDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TagDto value)?  $default,){
final _that = this;
switch (_that) {
case _TagDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String name,  String slug,  String color, @JsonKey(name: 'text_color')  String textColor, @JsonKey(name: 'match')  String match, @JsonKey(name: 'matching_algorithm')  int matchingAlgorithm, @JsonKey(name: 'is_insensitive')  bool isInsensitive, @JsonKey(name: 'is_inbox_tag')  bool isInboxTag)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TagDto() when $default != null:
return $default(_that.id,_that.name,_that.slug,_that.color,_that.textColor,_that.match,_that.matchingAlgorithm,_that.isInsensitive,_that.isInboxTag);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String name,  String slug,  String color, @JsonKey(name: 'text_color')  String textColor, @JsonKey(name: 'match')  String match, @JsonKey(name: 'matching_algorithm')  int matchingAlgorithm, @JsonKey(name: 'is_insensitive')  bool isInsensitive, @JsonKey(name: 'is_inbox_tag')  bool isInboxTag)  $default,) {final _that = this;
switch (_that) {
case _TagDto():
return $default(_that.id,_that.name,_that.slug,_that.color,_that.textColor,_that.match,_that.matchingAlgorithm,_that.isInsensitive,_that.isInboxTag);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String name,  String slug,  String color, @JsonKey(name: 'text_color')  String textColor, @JsonKey(name: 'match')  String match, @JsonKey(name: 'matching_algorithm')  int matchingAlgorithm, @JsonKey(name: 'is_insensitive')  bool isInsensitive, @JsonKey(name: 'is_inbox_tag')  bool isInboxTag)?  $default,) {final _that = this;
switch (_that) {
case _TagDto() when $default != null:
return $default(_that.id,_that.name,_that.slug,_that.color,_that.textColor,_that.match,_that.matchingAlgorithm,_that.isInsensitive,_that.isInboxTag);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TagDto implements TagDto {
  const _TagDto({required this.id, required this.name, required this.slug, required this.color, @JsonKey(name: 'text_color') required this.textColor, @JsonKey(name: 'match') required this.match, @JsonKey(name: 'matching_algorithm') required this.matchingAlgorithm, @JsonKey(name: 'is_insensitive') required this.isInsensitive, @JsonKey(name: 'is_inbox_tag') required this.isInboxTag});
  factory _TagDto.fromJson(Map<String, dynamic> json) => _$TagDtoFromJson(json);

@override final  int id;
@override final  String name;
@override final  String slug;
@override final  String color;
@override@JsonKey(name: 'text_color') final  String textColor;
@override@JsonKey(name: 'match') final  String match;
@override@JsonKey(name: 'matching_algorithm') final  int matchingAlgorithm;
@override@JsonKey(name: 'is_insensitive') final  bool isInsensitive;
@override@JsonKey(name: 'is_inbox_tag') final  bool isInboxTag;

/// Create a copy of TagDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TagDtoCopyWith<_TagDto> get copyWith => __$TagDtoCopyWithImpl<_TagDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TagDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TagDto&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.slug, slug) || other.slug == slug)&&(identical(other.color, color) || other.color == color)&&(identical(other.textColor, textColor) || other.textColor == textColor)&&(identical(other.match, match) || other.match == match)&&(identical(other.matchingAlgorithm, matchingAlgorithm) || other.matchingAlgorithm == matchingAlgorithm)&&(identical(other.isInsensitive, isInsensitive) || other.isInsensitive == isInsensitive)&&(identical(other.isInboxTag, isInboxTag) || other.isInboxTag == isInboxTag));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,slug,color,textColor,match,matchingAlgorithm,isInsensitive,isInboxTag);

@override
String toString() {
  return 'TagDto(id: $id, name: $name, slug: $slug, color: $color, textColor: $textColor, match: $match, matchingAlgorithm: $matchingAlgorithm, isInsensitive: $isInsensitive, isInboxTag: $isInboxTag)';
}


}

/// @nodoc
abstract mixin class _$TagDtoCopyWith<$Res> implements $TagDtoCopyWith<$Res> {
  factory _$TagDtoCopyWith(_TagDto value, $Res Function(_TagDto) _then) = __$TagDtoCopyWithImpl;
@override @useResult
$Res call({
 int id, String name, String slug, String color,@JsonKey(name: 'text_color') String textColor,@JsonKey(name: 'match') String match,@JsonKey(name: 'matching_algorithm') int matchingAlgorithm,@JsonKey(name: 'is_insensitive') bool isInsensitive,@JsonKey(name: 'is_inbox_tag') bool isInboxTag
});




}
/// @nodoc
class __$TagDtoCopyWithImpl<$Res>
    implements _$TagDtoCopyWith<$Res> {
  __$TagDtoCopyWithImpl(this._self, this._then);

  final _TagDto _self;
  final $Res Function(_TagDto) _then;

/// Create a copy of TagDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? slug = null,Object? color = null,Object? textColor = null,Object? match = null,Object? matchingAlgorithm = null,Object? isInsensitive = null,Object? isInboxTag = null,}) {
  return _then(_TagDto(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,slug: null == slug ? _self.slug : slug // ignore: cast_nullable_to_non_nullable
as String,color: null == color ? _self.color : color // ignore: cast_nullable_to_non_nullable
as String,textColor: null == textColor ? _self.textColor : textColor // ignore: cast_nullable_to_non_nullable
as String,match: null == match ? _self.match : match // ignore: cast_nullable_to_non_nullable
as String,matchingAlgorithm: null == matchingAlgorithm ? _self.matchingAlgorithm : matchingAlgorithm // ignore: cast_nullable_to_non_nullable
as int,isInsensitive: null == isInsensitive ? _self.isInsensitive : isInsensitive // ignore: cast_nullable_to_non_nullable
as bool,isInboxTag: null == isInboxTag ? _self.isInboxTag : isInboxTag // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
