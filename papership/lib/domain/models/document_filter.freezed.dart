// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'document_filter.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DocumentFilter {

 String? get query; String? get tagIds; int? get correspondentId; int? get documentTypeId; String? get ordering; int get page;
/// Create a copy of DocumentFilter
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DocumentFilterCopyWith<DocumentFilter> get copyWith => _$DocumentFilterCopyWithImpl<DocumentFilter>(this as DocumentFilter, _$identity);

  /// Serializes this DocumentFilter to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DocumentFilter&&(identical(other.query, query) || other.query == query)&&(identical(other.tagIds, tagIds) || other.tagIds == tagIds)&&(identical(other.correspondentId, correspondentId) || other.correspondentId == correspondentId)&&(identical(other.documentTypeId, documentTypeId) || other.documentTypeId == documentTypeId)&&(identical(other.ordering, ordering) || other.ordering == ordering)&&(identical(other.page, page) || other.page == page));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,query,tagIds,correspondentId,documentTypeId,ordering,page);

@override
String toString() {
  return 'DocumentFilter(query: $query, tagIds: $tagIds, correspondentId: $correspondentId, documentTypeId: $documentTypeId, ordering: $ordering, page: $page)';
}


}

/// @nodoc
abstract mixin class $DocumentFilterCopyWith<$Res>  {
  factory $DocumentFilterCopyWith(DocumentFilter value, $Res Function(DocumentFilter) _then) = _$DocumentFilterCopyWithImpl;
@useResult
$Res call({
 String? query, String? tagIds, int? correspondentId, int? documentTypeId, String? ordering, int page
});




}
/// @nodoc
class _$DocumentFilterCopyWithImpl<$Res>
    implements $DocumentFilterCopyWith<$Res> {
  _$DocumentFilterCopyWithImpl(this._self, this._then);

  final DocumentFilter _self;
  final $Res Function(DocumentFilter) _then;

/// Create a copy of DocumentFilter
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? query = freezed,Object? tagIds = freezed,Object? correspondentId = freezed,Object? documentTypeId = freezed,Object? ordering = freezed,Object? page = null,}) {
  return _then(_self.copyWith(
query: freezed == query ? _self.query : query // ignore: cast_nullable_to_non_nullable
as String?,tagIds: freezed == tagIds ? _self.tagIds : tagIds // ignore: cast_nullable_to_non_nullable
as String?,correspondentId: freezed == correspondentId ? _self.correspondentId : correspondentId // ignore: cast_nullable_to_non_nullable
as int?,documentTypeId: freezed == documentTypeId ? _self.documentTypeId : documentTypeId // ignore: cast_nullable_to_non_nullable
as int?,ordering: freezed == ordering ? _self.ordering : ordering // ignore: cast_nullable_to_non_nullable
as String?,page: null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [DocumentFilter].
extension DocumentFilterPatterns on DocumentFilter {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DocumentFilter value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DocumentFilter() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DocumentFilter value)  $default,){
final _that = this;
switch (_that) {
case _DocumentFilter():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DocumentFilter value)?  $default,){
final _that = this;
switch (_that) {
case _DocumentFilter() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? query,  String? tagIds,  int? correspondentId,  int? documentTypeId,  String? ordering,  int page)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DocumentFilter() when $default != null:
return $default(_that.query,_that.tagIds,_that.correspondentId,_that.documentTypeId,_that.ordering,_that.page);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? query,  String? tagIds,  int? correspondentId,  int? documentTypeId,  String? ordering,  int page)  $default,) {final _that = this;
switch (_that) {
case _DocumentFilter():
return $default(_that.query,_that.tagIds,_that.correspondentId,_that.documentTypeId,_that.ordering,_that.page);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? query,  String? tagIds,  int? correspondentId,  int? documentTypeId,  String? ordering,  int page)?  $default,) {final _that = this;
switch (_that) {
case _DocumentFilter() when $default != null:
return $default(_that.query,_that.tagIds,_that.correspondentId,_that.documentTypeId,_that.ordering,_that.page);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DocumentFilter implements DocumentFilter {
  const _DocumentFilter({this.query, this.tagIds, this.correspondentId, this.documentTypeId, this.ordering, this.page = 1});
  factory _DocumentFilter.fromJson(Map<String, dynamic> json) => _$DocumentFilterFromJson(json);

@override final  String? query;
@override final  String? tagIds;
@override final  int? correspondentId;
@override final  int? documentTypeId;
@override final  String? ordering;
@override@JsonKey() final  int page;

/// Create a copy of DocumentFilter
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DocumentFilterCopyWith<_DocumentFilter> get copyWith => __$DocumentFilterCopyWithImpl<_DocumentFilter>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DocumentFilterToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DocumentFilter&&(identical(other.query, query) || other.query == query)&&(identical(other.tagIds, tagIds) || other.tagIds == tagIds)&&(identical(other.correspondentId, correspondentId) || other.correspondentId == correspondentId)&&(identical(other.documentTypeId, documentTypeId) || other.documentTypeId == documentTypeId)&&(identical(other.ordering, ordering) || other.ordering == ordering)&&(identical(other.page, page) || other.page == page));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,query,tagIds,correspondentId,documentTypeId,ordering,page);

@override
String toString() {
  return 'DocumentFilter(query: $query, tagIds: $tagIds, correspondentId: $correspondentId, documentTypeId: $documentTypeId, ordering: $ordering, page: $page)';
}


}

/// @nodoc
abstract mixin class _$DocumentFilterCopyWith<$Res> implements $DocumentFilterCopyWith<$Res> {
  factory _$DocumentFilterCopyWith(_DocumentFilter value, $Res Function(_DocumentFilter) _then) = __$DocumentFilterCopyWithImpl;
@override @useResult
$Res call({
 String? query, String? tagIds, int? correspondentId, int? documentTypeId, String? ordering, int page
});




}
/// @nodoc
class __$DocumentFilterCopyWithImpl<$Res>
    implements _$DocumentFilterCopyWith<$Res> {
  __$DocumentFilterCopyWithImpl(this._self, this._then);

  final _DocumentFilter _self;
  final $Res Function(_DocumentFilter) _then;

/// Create a copy of DocumentFilter
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? query = freezed,Object? tagIds = freezed,Object? correspondentId = freezed,Object? documentTypeId = freezed,Object? ordering = freezed,Object? page = null,}) {
  return _then(_DocumentFilter(
query: freezed == query ? _self.query : query // ignore: cast_nullable_to_non_nullable
as String?,tagIds: freezed == tagIds ? _self.tagIds : tagIds // ignore: cast_nullable_to_non_nullable
as String?,correspondentId: freezed == correspondentId ? _self.correspondentId : correspondentId // ignore: cast_nullable_to_non_nullable
as int?,documentTypeId: freezed == documentTypeId ? _self.documentTypeId : documentTypeId // ignore: cast_nullable_to_non_nullable
as int?,ordering: freezed == ordering ? _self.ordering : ordering // ignore: cast_nullable_to_non_nullable
as String?,page: null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
