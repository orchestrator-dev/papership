// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'document_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DocumentDto {

 int get id; String get title; String? get content; List<int> get tags; int? get correspondent;@JsonKey(name: 'document_type') int? get documentType;@JsonKey(name: 'storage_path') String? get storagePath; String get created; String get added; String get modified; String? get asn;@JsonKey(name: 'page_count') int? get pageCount;@JsonKey(name: 'original_file_name') String get originalFileName;@JsonKey(name: 'archived_file_name') String get archivedFileName;
/// Create a copy of DocumentDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DocumentDtoCopyWith<DocumentDto> get copyWith => _$DocumentDtoCopyWithImpl<DocumentDto>(this as DocumentDto, _$identity);

  /// Serializes this DocumentDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DocumentDto&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.content, content) || other.content == content)&&const DeepCollectionEquality().equals(other.tags, tags)&&(identical(other.correspondent, correspondent) || other.correspondent == correspondent)&&(identical(other.documentType, documentType) || other.documentType == documentType)&&(identical(other.storagePath, storagePath) || other.storagePath == storagePath)&&(identical(other.created, created) || other.created == created)&&(identical(other.added, added) || other.added == added)&&(identical(other.modified, modified) || other.modified == modified)&&(identical(other.asn, asn) || other.asn == asn)&&(identical(other.pageCount, pageCount) || other.pageCount == pageCount)&&(identical(other.originalFileName, originalFileName) || other.originalFileName == originalFileName)&&(identical(other.archivedFileName, archivedFileName) || other.archivedFileName == archivedFileName));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,content,const DeepCollectionEquality().hash(tags),correspondent,documentType,storagePath,created,added,modified,asn,pageCount,originalFileName,archivedFileName);

@override
String toString() {
  return 'DocumentDto(id: $id, title: $title, content: $content, tags: $tags, correspondent: $correspondent, documentType: $documentType, storagePath: $storagePath, created: $created, added: $added, modified: $modified, asn: $asn, pageCount: $pageCount, originalFileName: $originalFileName, archivedFileName: $archivedFileName)';
}


}

/// @nodoc
abstract mixin class $DocumentDtoCopyWith<$Res>  {
  factory $DocumentDtoCopyWith(DocumentDto value, $Res Function(DocumentDto) _then) = _$DocumentDtoCopyWithImpl;
@useResult
$Res call({
 int id, String title, String? content, List<int> tags, int? correspondent,@JsonKey(name: 'document_type') int? documentType,@JsonKey(name: 'storage_path') String? storagePath, String created, String added, String modified, String? asn,@JsonKey(name: 'page_count') int? pageCount,@JsonKey(name: 'original_file_name') String originalFileName,@JsonKey(name: 'archived_file_name') String archivedFileName
});




}
/// @nodoc
class _$DocumentDtoCopyWithImpl<$Res>
    implements $DocumentDtoCopyWith<$Res> {
  _$DocumentDtoCopyWithImpl(this._self, this._then);

  final DocumentDto _self;
  final $Res Function(DocumentDto) _then;

/// Create a copy of DocumentDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? title = null,Object? content = freezed,Object? tags = null,Object? correspondent = freezed,Object? documentType = freezed,Object? storagePath = freezed,Object? created = null,Object? added = null,Object? modified = null,Object? asn = freezed,Object? pageCount = freezed,Object? originalFileName = null,Object? archivedFileName = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,content: freezed == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String?,tags: null == tags ? _self.tags : tags // ignore: cast_nullable_to_non_nullable
as List<int>,correspondent: freezed == correspondent ? _self.correspondent : correspondent // ignore: cast_nullable_to_non_nullable
as int?,documentType: freezed == documentType ? _self.documentType : documentType // ignore: cast_nullable_to_non_nullable
as int?,storagePath: freezed == storagePath ? _self.storagePath : storagePath // ignore: cast_nullable_to_non_nullable
as String?,created: null == created ? _self.created : created // ignore: cast_nullable_to_non_nullable
as String,added: null == added ? _self.added : added // ignore: cast_nullable_to_non_nullable
as String,modified: null == modified ? _self.modified : modified // ignore: cast_nullable_to_non_nullable
as String,asn: freezed == asn ? _self.asn : asn // ignore: cast_nullable_to_non_nullable
as String?,pageCount: freezed == pageCount ? _self.pageCount : pageCount // ignore: cast_nullable_to_non_nullable
as int?,originalFileName: null == originalFileName ? _self.originalFileName : originalFileName // ignore: cast_nullable_to_non_nullable
as String,archivedFileName: null == archivedFileName ? _self.archivedFileName : archivedFileName // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [DocumentDto].
extension DocumentDtoPatterns on DocumentDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DocumentDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DocumentDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DocumentDto value)  $default,){
final _that = this;
switch (_that) {
case _DocumentDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DocumentDto value)?  $default,){
final _that = this;
switch (_that) {
case _DocumentDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String title,  String? content,  List<int> tags,  int? correspondent, @JsonKey(name: 'document_type')  int? documentType, @JsonKey(name: 'storage_path')  String? storagePath,  String created,  String added,  String modified,  String? asn, @JsonKey(name: 'page_count')  int? pageCount, @JsonKey(name: 'original_file_name')  String originalFileName, @JsonKey(name: 'archived_file_name')  String archivedFileName)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DocumentDto() when $default != null:
return $default(_that.id,_that.title,_that.content,_that.tags,_that.correspondent,_that.documentType,_that.storagePath,_that.created,_that.added,_that.modified,_that.asn,_that.pageCount,_that.originalFileName,_that.archivedFileName);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String title,  String? content,  List<int> tags,  int? correspondent, @JsonKey(name: 'document_type')  int? documentType, @JsonKey(name: 'storage_path')  String? storagePath,  String created,  String added,  String modified,  String? asn, @JsonKey(name: 'page_count')  int? pageCount, @JsonKey(name: 'original_file_name')  String originalFileName, @JsonKey(name: 'archived_file_name')  String archivedFileName)  $default,) {final _that = this;
switch (_that) {
case _DocumentDto():
return $default(_that.id,_that.title,_that.content,_that.tags,_that.correspondent,_that.documentType,_that.storagePath,_that.created,_that.added,_that.modified,_that.asn,_that.pageCount,_that.originalFileName,_that.archivedFileName);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String title,  String? content,  List<int> tags,  int? correspondent, @JsonKey(name: 'document_type')  int? documentType, @JsonKey(name: 'storage_path')  String? storagePath,  String created,  String added,  String modified,  String? asn, @JsonKey(name: 'page_count')  int? pageCount, @JsonKey(name: 'original_file_name')  String originalFileName, @JsonKey(name: 'archived_file_name')  String archivedFileName)?  $default,) {final _that = this;
switch (_that) {
case _DocumentDto() when $default != null:
return $default(_that.id,_that.title,_that.content,_that.tags,_that.correspondent,_that.documentType,_that.storagePath,_that.created,_that.added,_that.modified,_that.asn,_that.pageCount,_that.originalFileName,_that.archivedFileName);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DocumentDto implements DocumentDto {
  const _DocumentDto({required this.id, required this.title, required this.content, required final  List<int> tags, required this.correspondent, @JsonKey(name: 'document_type') required this.documentType, @JsonKey(name: 'storage_path') required this.storagePath, required this.created, required this.added, required this.modified, required this.asn, @JsonKey(name: 'page_count') required this.pageCount, @JsonKey(name: 'original_file_name') required this.originalFileName, @JsonKey(name: 'archived_file_name') required this.archivedFileName}): _tags = tags;
  factory _DocumentDto.fromJson(Map<String, dynamic> json) => _$DocumentDtoFromJson(json);

@override final  int id;
@override final  String title;
@override final  String? content;
 final  List<int> _tags;
@override List<int> get tags {
  if (_tags is EqualUnmodifiableListView) return _tags;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_tags);
}

@override final  int? correspondent;
@override@JsonKey(name: 'document_type') final  int? documentType;
@override@JsonKey(name: 'storage_path') final  String? storagePath;
@override final  String created;
@override final  String added;
@override final  String modified;
@override final  String? asn;
@override@JsonKey(name: 'page_count') final  int? pageCount;
@override@JsonKey(name: 'original_file_name') final  String originalFileName;
@override@JsonKey(name: 'archived_file_name') final  String archivedFileName;

/// Create a copy of DocumentDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DocumentDtoCopyWith<_DocumentDto> get copyWith => __$DocumentDtoCopyWithImpl<_DocumentDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DocumentDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DocumentDto&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.content, content) || other.content == content)&&const DeepCollectionEquality().equals(other._tags, _tags)&&(identical(other.correspondent, correspondent) || other.correspondent == correspondent)&&(identical(other.documentType, documentType) || other.documentType == documentType)&&(identical(other.storagePath, storagePath) || other.storagePath == storagePath)&&(identical(other.created, created) || other.created == created)&&(identical(other.added, added) || other.added == added)&&(identical(other.modified, modified) || other.modified == modified)&&(identical(other.asn, asn) || other.asn == asn)&&(identical(other.pageCount, pageCount) || other.pageCount == pageCount)&&(identical(other.originalFileName, originalFileName) || other.originalFileName == originalFileName)&&(identical(other.archivedFileName, archivedFileName) || other.archivedFileName == archivedFileName));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,content,const DeepCollectionEquality().hash(_tags),correspondent,documentType,storagePath,created,added,modified,asn,pageCount,originalFileName,archivedFileName);

@override
String toString() {
  return 'DocumentDto(id: $id, title: $title, content: $content, tags: $tags, correspondent: $correspondent, documentType: $documentType, storagePath: $storagePath, created: $created, added: $added, modified: $modified, asn: $asn, pageCount: $pageCount, originalFileName: $originalFileName, archivedFileName: $archivedFileName)';
}


}

/// @nodoc
abstract mixin class _$DocumentDtoCopyWith<$Res> implements $DocumentDtoCopyWith<$Res> {
  factory _$DocumentDtoCopyWith(_DocumentDto value, $Res Function(_DocumentDto) _then) = __$DocumentDtoCopyWithImpl;
@override @useResult
$Res call({
 int id, String title, String? content, List<int> tags, int? correspondent,@JsonKey(name: 'document_type') int? documentType,@JsonKey(name: 'storage_path') String? storagePath, String created, String added, String modified, String? asn,@JsonKey(name: 'page_count') int? pageCount,@JsonKey(name: 'original_file_name') String originalFileName,@JsonKey(name: 'archived_file_name') String archivedFileName
});




}
/// @nodoc
class __$DocumentDtoCopyWithImpl<$Res>
    implements _$DocumentDtoCopyWith<$Res> {
  __$DocumentDtoCopyWithImpl(this._self, this._then);

  final _DocumentDto _self;
  final $Res Function(_DocumentDto) _then;

/// Create a copy of DocumentDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? title = null,Object? content = freezed,Object? tags = null,Object? correspondent = freezed,Object? documentType = freezed,Object? storagePath = freezed,Object? created = null,Object? added = null,Object? modified = null,Object? asn = freezed,Object? pageCount = freezed,Object? originalFileName = null,Object? archivedFileName = null,}) {
  return _then(_DocumentDto(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,content: freezed == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String?,tags: null == tags ? _self._tags : tags // ignore: cast_nullable_to_non_nullable
as List<int>,correspondent: freezed == correspondent ? _self.correspondent : correspondent // ignore: cast_nullable_to_non_nullable
as int?,documentType: freezed == documentType ? _self.documentType : documentType // ignore: cast_nullable_to_non_nullable
as int?,storagePath: freezed == storagePath ? _self.storagePath : storagePath // ignore: cast_nullable_to_non_nullable
as String?,created: null == created ? _self.created : created // ignore: cast_nullable_to_non_nullable
as String,added: null == added ? _self.added : added // ignore: cast_nullable_to_non_nullable
as String,modified: null == modified ? _self.modified : modified // ignore: cast_nullable_to_non_nullable
as String,asn: freezed == asn ? _self.asn : asn // ignore: cast_nullable_to_non_nullable
as String?,pageCount: freezed == pageCount ? _self.pageCount : pageCount // ignore: cast_nullable_to_non_nullable
as int?,originalFileName: null == originalFileName ? _self.originalFileName : originalFileName // ignore: cast_nullable_to_non_nullable
as String,archivedFileName: null == archivedFileName ? _self.archivedFileName : archivedFileName // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$DocumentUpdateDto {

 String? get title; String? get content; List<int>? get tags; int? get correspondent;@JsonKey(name: 'document_type') int? get documentType;@JsonKey(name: 'storage_path') int? get storagePath; String? get created; String? get asn;
/// Create a copy of DocumentUpdateDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DocumentUpdateDtoCopyWith<DocumentUpdateDto> get copyWith => _$DocumentUpdateDtoCopyWithImpl<DocumentUpdateDto>(this as DocumentUpdateDto, _$identity);

  /// Serializes this DocumentUpdateDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DocumentUpdateDto&&(identical(other.title, title) || other.title == title)&&(identical(other.content, content) || other.content == content)&&const DeepCollectionEquality().equals(other.tags, tags)&&(identical(other.correspondent, correspondent) || other.correspondent == correspondent)&&(identical(other.documentType, documentType) || other.documentType == documentType)&&(identical(other.storagePath, storagePath) || other.storagePath == storagePath)&&(identical(other.created, created) || other.created == created)&&(identical(other.asn, asn) || other.asn == asn));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,title,content,const DeepCollectionEquality().hash(tags),correspondent,documentType,storagePath,created,asn);

@override
String toString() {
  return 'DocumentUpdateDto(title: $title, content: $content, tags: $tags, correspondent: $correspondent, documentType: $documentType, storagePath: $storagePath, created: $created, asn: $asn)';
}


}

/// @nodoc
abstract mixin class $DocumentUpdateDtoCopyWith<$Res>  {
  factory $DocumentUpdateDtoCopyWith(DocumentUpdateDto value, $Res Function(DocumentUpdateDto) _then) = _$DocumentUpdateDtoCopyWithImpl;
@useResult
$Res call({
 String? title, String? content, List<int>? tags, int? correspondent,@JsonKey(name: 'document_type') int? documentType,@JsonKey(name: 'storage_path') int? storagePath, String? created, String? asn
});




}
/// @nodoc
class _$DocumentUpdateDtoCopyWithImpl<$Res>
    implements $DocumentUpdateDtoCopyWith<$Res> {
  _$DocumentUpdateDtoCopyWithImpl(this._self, this._then);

  final DocumentUpdateDto _self;
  final $Res Function(DocumentUpdateDto) _then;

/// Create a copy of DocumentUpdateDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? title = freezed,Object? content = freezed,Object? tags = freezed,Object? correspondent = freezed,Object? documentType = freezed,Object? storagePath = freezed,Object? created = freezed,Object? asn = freezed,}) {
  return _then(_self.copyWith(
title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String?,content: freezed == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String?,tags: freezed == tags ? _self.tags : tags // ignore: cast_nullable_to_non_nullable
as List<int>?,correspondent: freezed == correspondent ? _self.correspondent : correspondent // ignore: cast_nullable_to_non_nullable
as int?,documentType: freezed == documentType ? _self.documentType : documentType // ignore: cast_nullable_to_non_nullable
as int?,storagePath: freezed == storagePath ? _self.storagePath : storagePath // ignore: cast_nullable_to_non_nullable
as int?,created: freezed == created ? _self.created : created // ignore: cast_nullable_to_non_nullable
as String?,asn: freezed == asn ? _self.asn : asn // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [DocumentUpdateDto].
extension DocumentUpdateDtoPatterns on DocumentUpdateDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DocumentUpdateDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DocumentUpdateDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DocumentUpdateDto value)  $default,){
final _that = this;
switch (_that) {
case _DocumentUpdateDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DocumentUpdateDto value)?  $default,){
final _that = this;
switch (_that) {
case _DocumentUpdateDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? title,  String? content,  List<int>? tags,  int? correspondent, @JsonKey(name: 'document_type')  int? documentType, @JsonKey(name: 'storage_path')  int? storagePath,  String? created,  String? asn)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DocumentUpdateDto() when $default != null:
return $default(_that.title,_that.content,_that.tags,_that.correspondent,_that.documentType,_that.storagePath,_that.created,_that.asn);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? title,  String? content,  List<int>? tags,  int? correspondent, @JsonKey(name: 'document_type')  int? documentType, @JsonKey(name: 'storage_path')  int? storagePath,  String? created,  String? asn)  $default,) {final _that = this;
switch (_that) {
case _DocumentUpdateDto():
return $default(_that.title,_that.content,_that.tags,_that.correspondent,_that.documentType,_that.storagePath,_that.created,_that.asn);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? title,  String? content,  List<int>? tags,  int? correspondent, @JsonKey(name: 'document_type')  int? documentType, @JsonKey(name: 'storage_path')  int? storagePath,  String? created,  String? asn)?  $default,) {final _that = this;
switch (_that) {
case _DocumentUpdateDto() when $default != null:
return $default(_that.title,_that.content,_that.tags,_that.correspondent,_that.documentType,_that.storagePath,_that.created,_that.asn);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DocumentUpdateDto implements DocumentUpdateDto {
  const _DocumentUpdateDto({this.title, this.content, final  List<int>? tags, this.correspondent, @JsonKey(name: 'document_type') this.documentType, @JsonKey(name: 'storage_path') this.storagePath, this.created, this.asn}): _tags = tags;
  factory _DocumentUpdateDto.fromJson(Map<String, dynamic> json) => _$DocumentUpdateDtoFromJson(json);

@override final  String? title;
@override final  String? content;
 final  List<int>? _tags;
@override List<int>? get tags {
  final value = _tags;
  if (value == null) return null;
  if (_tags is EqualUnmodifiableListView) return _tags;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override final  int? correspondent;
@override@JsonKey(name: 'document_type') final  int? documentType;
@override@JsonKey(name: 'storage_path') final  int? storagePath;
@override final  String? created;
@override final  String? asn;

/// Create a copy of DocumentUpdateDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DocumentUpdateDtoCopyWith<_DocumentUpdateDto> get copyWith => __$DocumentUpdateDtoCopyWithImpl<_DocumentUpdateDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DocumentUpdateDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DocumentUpdateDto&&(identical(other.title, title) || other.title == title)&&(identical(other.content, content) || other.content == content)&&const DeepCollectionEquality().equals(other._tags, _tags)&&(identical(other.correspondent, correspondent) || other.correspondent == correspondent)&&(identical(other.documentType, documentType) || other.documentType == documentType)&&(identical(other.storagePath, storagePath) || other.storagePath == storagePath)&&(identical(other.created, created) || other.created == created)&&(identical(other.asn, asn) || other.asn == asn));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,title,content,const DeepCollectionEquality().hash(_tags),correspondent,documentType,storagePath,created,asn);

@override
String toString() {
  return 'DocumentUpdateDto(title: $title, content: $content, tags: $tags, correspondent: $correspondent, documentType: $documentType, storagePath: $storagePath, created: $created, asn: $asn)';
}


}

/// @nodoc
abstract mixin class _$DocumentUpdateDtoCopyWith<$Res> implements $DocumentUpdateDtoCopyWith<$Res> {
  factory _$DocumentUpdateDtoCopyWith(_DocumentUpdateDto value, $Res Function(_DocumentUpdateDto) _then) = __$DocumentUpdateDtoCopyWithImpl;
@override @useResult
$Res call({
 String? title, String? content, List<int>? tags, int? correspondent,@JsonKey(name: 'document_type') int? documentType,@JsonKey(name: 'storage_path') int? storagePath, String? created, String? asn
});




}
/// @nodoc
class __$DocumentUpdateDtoCopyWithImpl<$Res>
    implements _$DocumentUpdateDtoCopyWith<$Res> {
  __$DocumentUpdateDtoCopyWithImpl(this._self, this._then);

  final _DocumentUpdateDto _self;
  final $Res Function(_DocumentUpdateDto) _then;

/// Create a copy of DocumentUpdateDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? title = freezed,Object? content = freezed,Object? tags = freezed,Object? correspondent = freezed,Object? documentType = freezed,Object? storagePath = freezed,Object? created = freezed,Object? asn = freezed,}) {
  return _then(_DocumentUpdateDto(
title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String?,content: freezed == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String?,tags: freezed == tags ? _self._tags : tags // ignore: cast_nullable_to_non_nullable
as List<int>?,correspondent: freezed == correspondent ? _self.correspondent : correspondent // ignore: cast_nullable_to_non_nullable
as int?,documentType: freezed == documentType ? _self.documentType : documentType // ignore: cast_nullable_to_non_nullable
as int?,storagePath: freezed == storagePath ? _self.storagePath : storagePath // ignore: cast_nullable_to_non_nullable
as int?,created: freezed == created ? _self.created : created // ignore: cast_nullable_to_non_nullable
as String?,asn: freezed == asn ? _self.asn : asn // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
