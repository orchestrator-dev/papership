// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pending_upload.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UploadMetadata {

 String? get title; List<int>? get tags; int? get correspondentId; int? get documentTypeId; String? get createdDate; String? get asn;
/// Create a copy of UploadMetadata
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UploadMetadataCopyWith<UploadMetadata> get copyWith => _$UploadMetadataCopyWithImpl<UploadMetadata>(this as UploadMetadata, _$identity);

  /// Serializes this UploadMetadata to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UploadMetadata&&(identical(other.title, title) || other.title == title)&&const DeepCollectionEquality().equals(other.tags, tags)&&(identical(other.correspondentId, correspondentId) || other.correspondentId == correspondentId)&&(identical(other.documentTypeId, documentTypeId) || other.documentTypeId == documentTypeId)&&(identical(other.createdDate, createdDate) || other.createdDate == createdDate)&&(identical(other.asn, asn) || other.asn == asn));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,title,const DeepCollectionEquality().hash(tags),correspondentId,documentTypeId,createdDate,asn);

@override
String toString() {
  return 'UploadMetadata(title: $title, tags: $tags, correspondentId: $correspondentId, documentTypeId: $documentTypeId, createdDate: $createdDate, asn: $asn)';
}


}

/// @nodoc
abstract mixin class $UploadMetadataCopyWith<$Res>  {
  factory $UploadMetadataCopyWith(UploadMetadata value, $Res Function(UploadMetadata) _then) = _$UploadMetadataCopyWithImpl;
@useResult
$Res call({
 String? title, List<int>? tags, int? correspondentId, int? documentTypeId, String? createdDate, String? asn
});




}
/// @nodoc
class _$UploadMetadataCopyWithImpl<$Res>
    implements $UploadMetadataCopyWith<$Res> {
  _$UploadMetadataCopyWithImpl(this._self, this._then);

  final UploadMetadata _self;
  final $Res Function(UploadMetadata) _then;

/// Create a copy of UploadMetadata
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? title = freezed,Object? tags = freezed,Object? correspondentId = freezed,Object? documentTypeId = freezed,Object? createdDate = freezed,Object? asn = freezed,}) {
  return _then(_self.copyWith(
title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String?,tags: freezed == tags ? _self.tags : tags // ignore: cast_nullable_to_non_nullable
as List<int>?,correspondentId: freezed == correspondentId ? _self.correspondentId : correspondentId // ignore: cast_nullable_to_non_nullable
as int?,documentTypeId: freezed == documentTypeId ? _self.documentTypeId : documentTypeId // ignore: cast_nullable_to_non_nullable
as int?,createdDate: freezed == createdDate ? _self.createdDate : createdDate // ignore: cast_nullable_to_non_nullable
as String?,asn: freezed == asn ? _self.asn : asn // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [UploadMetadata].
extension UploadMetadataPatterns on UploadMetadata {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UploadMetadata value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UploadMetadata() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UploadMetadata value)  $default,){
final _that = this;
switch (_that) {
case _UploadMetadata():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UploadMetadata value)?  $default,){
final _that = this;
switch (_that) {
case _UploadMetadata() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? title,  List<int>? tags,  int? correspondentId,  int? documentTypeId,  String? createdDate,  String? asn)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UploadMetadata() when $default != null:
return $default(_that.title,_that.tags,_that.correspondentId,_that.documentTypeId,_that.createdDate,_that.asn);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? title,  List<int>? tags,  int? correspondentId,  int? documentTypeId,  String? createdDate,  String? asn)  $default,) {final _that = this;
switch (_that) {
case _UploadMetadata():
return $default(_that.title,_that.tags,_that.correspondentId,_that.documentTypeId,_that.createdDate,_that.asn);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? title,  List<int>? tags,  int? correspondentId,  int? documentTypeId,  String? createdDate,  String? asn)?  $default,) {final _that = this;
switch (_that) {
case _UploadMetadata() when $default != null:
return $default(_that.title,_that.tags,_that.correspondentId,_that.documentTypeId,_that.createdDate,_that.asn);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _UploadMetadata implements UploadMetadata {
  const _UploadMetadata({this.title, final  List<int>? tags, this.correspondentId, this.documentTypeId, this.createdDate, this.asn}): _tags = tags;
  factory _UploadMetadata.fromJson(Map<String, dynamic> json) => _$UploadMetadataFromJson(json);

@override final  String? title;
 final  List<int>? _tags;
@override List<int>? get tags {
  final value = _tags;
  if (value == null) return null;
  if (_tags is EqualUnmodifiableListView) return _tags;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override final  int? correspondentId;
@override final  int? documentTypeId;
@override final  String? createdDate;
@override final  String? asn;

/// Create a copy of UploadMetadata
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UploadMetadataCopyWith<_UploadMetadata> get copyWith => __$UploadMetadataCopyWithImpl<_UploadMetadata>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UploadMetadataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UploadMetadata&&(identical(other.title, title) || other.title == title)&&const DeepCollectionEquality().equals(other._tags, _tags)&&(identical(other.correspondentId, correspondentId) || other.correspondentId == correspondentId)&&(identical(other.documentTypeId, documentTypeId) || other.documentTypeId == documentTypeId)&&(identical(other.createdDate, createdDate) || other.createdDate == createdDate)&&(identical(other.asn, asn) || other.asn == asn));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,title,const DeepCollectionEquality().hash(_tags),correspondentId,documentTypeId,createdDate,asn);

@override
String toString() {
  return 'UploadMetadata(title: $title, tags: $tags, correspondentId: $correspondentId, documentTypeId: $documentTypeId, createdDate: $createdDate, asn: $asn)';
}


}

/// @nodoc
abstract mixin class _$UploadMetadataCopyWith<$Res> implements $UploadMetadataCopyWith<$Res> {
  factory _$UploadMetadataCopyWith(_UploadMetadata value, $Res Function(_UploadMetadata) _then) = __$UploadMetadataCopyWithImpl;
@override @useResult
$Res call({
 String? title, List<int>? tags, int? correspondentId, int? documentTypeId, String? createdDate, String? asn
});




}
/// @nodoc
class __$UploadMetadataCopyWithImpl<$Res>
    implements _$UploadMetadataCopyWith<$Res> {
  __$UploadMetadataCopyWithImpl(this._self, this._then);

  final _UploadMetadata _self;
  final $Res Function(_UploadMetadata) _then;

/// Create a copy of UploadMetadata
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? title = freezed,Object? tags = freezed,Object? correspondentId = freezed,Object? documentTypeId = freezed,Object? createdDate = freezed,Object? asn = freezed,}) {
  return _then(_UploadMetadata(
title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String?,tags: freezed == tags ? _self._tags : tags // ignore: cast_nullable_to_non_nullable
as List<int>?,correspondentId: freezed == correspondentId ? _self.correspondentId : correspondentId // ignore: cast_nullable_to_non_nullable
as int?,documentTypeId: freezed == documentTypeId ? _self.documentTypeId : documentTypeId // ignore: cast_nullable_to_non_nullable
as int?,createdDate: freezed == createdDate ? _self.createdDate : createdDate // ignore: cast_nullable_to_non_nullable
as String?,asn: freezed == asn ? _self.asn : asn // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$PendingUpload {

 String get id; String get pdfPath; UploadMetadata get metadata; DateTime get createdAt; int get retryCount;
/// Create a copy of PendingUpload
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PendingUploadCopyWith<PendingUpload> get copyWith => _$PendingUploadCopyWithImpl<PendingUpload>(this as PendingUpload, _$identity);

  /// Serializes this PendingUpload to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PendingUpload&&(identical(other.id, id) || other.id == id)&&(identical(other.pdfPath, pdfPath) || other.pdfPath == pdfPath)&&(identical(other.metadata, metadata) || other.metadata == metadata)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.retryCount, retryCount) || other.retryCount == retryCount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,pdfPath,metadata,createdAt,retryCount);

@override
String toString() {
  return 'PendingUpload(id: $id, pdfPath: $pdfPath, metadata: $metadata, createdAt: $createdAt, retryCount: $retryCount)';
}


}

/// @nodoc
abstract mixin class $PendingUploadCopyWith<$Res>  {
  factory $PendingUploadCopyWith(PendingUpload value, $Res Function(PendingUpload) _then) = _$PendingUploadCopyWithImpl;
@useResult
$Res call({
 String id, String pdfPath, UploadMetadata metadata, DateTime createdAt, int retryCount
});


$UploadMetadataCopyWith<$Res> get metadata;

}
/// @nodoc
class _$PendingUploadCopyWithImpl<$Res>
    implements $PendingUploadCopyWith<$Res> {
  _$PendingUploadCopyWithImpl(this._self, this._then);

  final PendingUpload _self;
  final $Res Function(PendingUpload) _then;

/// Create a copy of PendingUpload
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? pdfPath = null,Object? metadata = null,Object? createdAt = null,Object? retryCount = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,pdfPath: null == pdfPath ? _self.pdfPath : pdfPath // ignore: cast_nullable_to_non_nullable
as String,metadata: null == metadata ? _self.metadata : metadata // ignore: cast_nullable_to_non_nullable
as UploadMetadata,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,retryCount: null == retryCount ? _self.retryCount : retryCount // ignore: cast_nullable_to_non_nullable
as int,
  ));
}
/// Create a copy of PendingUpload
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UploadMetadataCopyWith<$Res> get metadata {
  
  return $UploadMetadataCopyWith<$Res>(_self.metadata, (value) {
    return _then(_self.copyWith(metadata: value));
  });
}
}


/// Adds pattern-matching-related methods to [PendingUpload].
extension PendingUploadPatterns on PendingUpload {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PendingUpload value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PendingUpload() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PendingUpload value)  $default,){
final _that = this;
switch (_that) {
case _PendingUpload():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PendingUpload value)?  $default,){
final _that = this;
switch (_that) {
case _PendingUpload() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String pdfPath,  UploadMetadata metadata,  DateTime createdAt,  int retryCount)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PendingUpload() when $default != null:
return $default(_that.id,_that.pdfPath,_that.metadata,_that.createdAt,_that.retryCount);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String pdfPath,  UploadMetadata metadata,  DateTime createdAt,  int retryCount)  $default,) {final _that = this;
switch (_that) {
case _PendingUpload():
return $default(_that.id,_that.pdfPath,_that.metadata,_that.createdAt,_that.retryCount);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String pdfPath,  UploadMetadata metadata,  DateTime createdAt,  int retryCount)?  $default,) {final _that = this;
switch (_that) {
case _PendingUpload() when $default != null:
return $default(_that.id,_that.pdfPath,_that.metadata,_that.createdAt,_that.retryCount);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PendingUpload implements PendingUpload {
  const _PendingUpload({required this.id, required this.pdfPath, required this.metadata, required this.createdAt, this.retryCount = 0});
  factory _PendingUpload.fromJson(Map<String, dynamic> json) => _$PendingUploadFromJson(json);

@override final  String id;
@override final  String pdfPath;
@override final  UploadMetadata metadata;
@override final  DateTime createdAt;
@override@JsonKey() final  int retryCount;

/// Create a copy of PendingUpload
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PendingUploadCopyWith<_PendingUpload> get copyWith => __$PendingUploadCopyWithImpl<_PendingUpload>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PendingUploadToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PendingUpload&&(identical(other.id, id) || other.id == id)&&(identical(other.pdfPath, pdfPath) || other.pdfPath == pdfPath)&&(identical(other.metadata, metadata) || other.metadata == metadata)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.retryCount, retryCount) || other.retryCount == retryCount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,pdfPath,metadata,createdAt,retryCount);

@override
String toString() {
  return 'PendingUpload(id: $id, pdfPath: $pdfPath, metadata: $metadata, createdAt: $createdAt, retryCount: $retryCount)';
}


}

/// @nodoc
abstract mixin class _$PendingUploadCopyWith<$Res> implements $PendingUploadCopyWith<$Res> {
  factory _$PendingUploadCopyWith(_PendingUpload value, $Res Function(_PendingUpload) _then) = __$PendingUploadCopyWithImpl;
@override @useResult
$Res call({
 String id, String pdfPath, UploadMetadata metadata, DateTime createdAt, int retryCount
});


@override $UploadMetadataCopyWith<$Res> get metadata;

}
/// @nodoc
class __$PendingUploadCopyWithImpl<$Res>
    implements _$PendingUploadCopyWith<$Res> {
  __$PendingUploadCopyWithImpl(this._self, this._then);

  final _PendingUpload _self;
  final $Res Function(_PendingUpload) _then;

/// Create a copy of PendingUpload
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? pdfPath = null,Object? metadata = null,Object? createdAt = null,Object? retryCount = null,}) {
  return _then(_PendingUpload(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,pdfPath: null == pdfPath ? _self.pdfPath : pdfPath // ignore: cast_nullable_to_non_nullable
as String,metadata: null == metadata ? _self.metadata : metadata // ignore: cast_nullable_to_non_nullable
as UploadMetadata,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,retryCount: null == retryCount ? _self.retryCount : retryCount // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

/// Create a copy of PendingUpload
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UploadMetadataCopyWith<$Res> get metadata {
  
  return $UploadMetadataCopyWith<$Res>(_self.metadata, (value) {
    return _then(_self.copyWith(metadata: value));
  });
}
}

// dart format on
