// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'saved_view_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SavedViewDto {

 int get id; String get name;@JsonKey(name: 'show_on_dashboard') bool get showOnDashboard;@JsonKey(name: 'show_in_sidebar') bool get showInSidebar;@JsonKey(name: 'sort_field') String get sortField;@JsonKey(name: 'sort_reverse') bool get sortReverse;
/// Create a copy of SavedViewDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SavedViewDtoCopyWith<SavedViewDto> get copyWith => _$SavedViewDtoCopyWithImpl<SavedViewDto>(this as SavedViewDto, _$identity);

  /// Serializes this SavedViewDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SavedViewDto&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.showOnDashboard, showOnDashboard) || other.showOnDashboard == showOnDashboard)&&(identical(other.showInSidebar, showInSidebar) || other.showInSidebar == showInSidebar)&&(identical(other.sortField, sortField) || other.sortField == sortField)&&(identical(other.sortReverse, sortReverse) || other.sortReverse == sortReverse));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,showOnDashboard,showInSidebar,sortField,sortReverse);

@override
String toString() {
  return 'SavedViewDto(id: $id, name: $name, showOnDashboard: $showOnDashboard, showInSidebar: $showInSidebar, sortField: $sortField, sortReverse: $sortReverse)';
}


}

/// @nodoc
abstract mixin class $SavedViewDtoCopyWith<$Res>  {
  factory $SavedViewDtoCopyWith(SavedViewDto value, $Res Function(SavedViewDto) _then) = _$SavedViewDtoCopyWithImpl;
@useResult
$Res call({
 int id, String name,@JsonKey(name: 'show_on_dashboard') bool showOnDashboard,@JsonKey(name: 'show_in_sidebar') bool showInSidebar,@JsonKey(name: 'sort_field') String sortField,@JsonKey(name: 'sort_reverse') bool sortReverse
});




}
/// @nodoc
class _$SavedViewDtoCopyWithImpl<$Res>
    implements $SavedViewDtoCopyWith<$Res> {
  _$SavedViewDtoCopyWithImpl(this._self, this._then);

  final SavedViewDto _self;
  final $Res Function(SavedViewDto) _then;

/// Create a copy of SavedViewDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? showOnDashboard = null,Object? showInSidebar = null,Object? sortField = null,Object? sortReverse = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,showOnDashboard: null == showOnDashboard ? _self.showOnDashboard : showOnDashboard // ignore: cast_nullable_to_non_nullable
as bool,showInSidebar: null == showInSidebar ? _self.showInSidebar : showInSidebar // ignore: cast_nullable_to_non_nullable
as bool,sortField: null == sortField ? _self.sortField : sortField // ignore: cast_nullable_to_non_nullable
as String,sortReverse: null == sortReverse ? _self.sortReverse : sortReverse // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [SavedViewDto].
extension SavedViewDtoPatterns on SavedViewDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SavedViewDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SavedViewDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SavedViewDto value)  $default,){
final _that = this;
switch (_that) {
case _SavedViewDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SavedViewDto value)?  $default,){
final _that = this;
switch (_that) {
case _SavedViewDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String name, @JsonKey(name: 'show_on_dashboard')  bool showOnDashboard, @JsonKey(name: 'show_in_sidebar')  bool showInSidebar, @JsonKey(name: 'sort_field')  String sortField, @JsonKey(name: 'sort_reverse')  bool sortReverse)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SavedViewDto() when $default != null:
return $default(_that.id,_that.name,_that.showOnDashboard,_that.showInSidebar,_that.sortField,_that.sortReverse);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String name, @JsonKey(name: 'show_on_dashboard')  bool showOnDashboard, @JsonKey(name: 'show_in_sidebar')  bool showInSidebar, @JsonKey(name: 'sort_field')  String sortField, @JsonKey(name: 'sort_reverse')  bool sortReverse)  $default,) {final _that = this;
switch (_that) {
case _SavedViewDto():
return $default(_that.id,_that.name,_that.showOnDashboard,_that.showInSidebar,_that.sortField,_that.sortReverse);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String name, @JsonKey(name: 'show_on_dashboard')  bool showOnDashboard, @JsonKey(name: 'show_in_sidebar')  bool showInSidebar, @JsonKey(name: 'sort_field')  String sortField, @JsonKey(name: 'sort_reverse')  bool sortReverse)?  $default,) {final _that = this;
switch (_that) {
case _SavedViewDto() when $default != null:
return $default(_that.id,_that.name,_that.showOnDashboard,_that.showInSidebar,_that.sortField,_that.sortReverse);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SavedViewDto implements SavedViewDto {
  const _SavedViewDto({required this.id, required this.name, @JsonKey(name: 'show_on_dashboard') required this.showOnDashboard, @JsonKey(name: 'show_in_sidebar') required this.showInSidebar, @JsonKey(name: 'sort_field') required this.sortField, @JsonKey(name: 'sort_reverse') required this.sortReverse});
  factory _SavedViewDto.fromJson(Map<String, dynamic> json) => _$SavedViewDtoFromJson(json);

@override final  int id;
@override final  String name;
@override@JsonKey(name: 'show_on_dashboard') final  bool showOnDashboard;
@override@JsonKey(name: 'show_in_sidebar') final  bool showInSidebar;
@override@JsonKey(name: 'sort_field') final  String sortField;
@override@JsonKey(name: 'sort_reverse') final  bool sortReverse;

/// Create a copy of SavedViewDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SavedViewDtoCopyWith<_SavedViewDto> get copyWith => __$SavedViewDtoCopyWithImpl<_SavedViewDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SavedViewDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SavedViewDto&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.showOnDashboard, showOnDashboard) || other.showOnDashboard == showOnDashboard)&&(identical(other.showInSidebar, showInSidebar) || other.showInSidebar == showInSidebar)&&(identical(other.sortField, sortField) || other.sortField == sortField)&&(identical(other.sortReverse, sortReverse) || other.sortReverse == sortReverse));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,showOnDashboard,showInSidebar,sortField,sortReverse);

@override
String toString() {
  return 'SavedViewDto(id: $id, name: $name, showOnDashboard: $showOnDashboard, showInSidebar: $showInSidebar, sortField: $sortField, sortReverse: $sortReverse)';
}


}

/// @nodoc
abstract mixin class _$SavedViewDtoCopyWith<$Res> implements $SavedViewDtoCopyWith<$Res> {
  factory _$SavedViewDtoCopyWith(_SavedViewDto value, $Res Function(_SavedViewDto) _then) = __$SavedViewDtoCopyWithImpl;
@override @useResult
$Res call({
 int id, String name,@JsonKey(name: 'show_on_dashboard') bool showOnDashboard,@JsonKey(name: 'show_in_sidebar') bool showInSidebar,@JsonKey(name: 'sort_field') String sortField,@JsonKey(name: 'sort_reverse') bool sortReverse
});




}
/// @nodoc
class __$SavedViewDtoCopyWithImpl<$Res>
    implements _$SavedViewDtoCopyWith<$Res> {
  __$SavedViewDtoCopyWithImpl(this._self, this._then);

  final _SavedViewDto _self;
  final $Res Function(_SavedViewDto) _then;

/// Create a copy of SavedViewDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? showOnDashboard = null,Object? showInSidebar = null,Object? sortField = null,Object? sortReverse = null,}) {
  return _then(_SavedViewDto(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,showOnDashboard: null == showOnDashboard ? _self.showOnDashboard : showOnDashboard // ignore: cast_nullable_to_non_nullable
as bool,showInSidebar: null == showInSidebar ? _self.showInSidebar : showInSidebar // ignore: cast_nullable_to_non_nullable
as bool,sortField: null == sortField ? _self.sortField : sortField // ignore: cast_nullable_to_non_nullable
as String,sortReverse: null == sortReverse ? _self.sortReverse : sortReverse // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
