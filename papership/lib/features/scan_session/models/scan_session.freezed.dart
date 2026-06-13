// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'scan_session.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ScannedPage {

 String get id; ScannedPageSource get source; Uint8List get imageBytes; int get rotationDegrees; bool get excluded; String? get thumbnailPath; double? get enhancedContrast; double? get brightnessAdjust;
/// Create a copy of ScannedPage
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ScannedPageCopyWith<ScannedPage> get copyWith => _$ScannedPageCopyWithImpl<ScannedPage>(this as ScannedPage, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ScannedPage&&(identical(other.id, id) || other.id == id)&&(identical(other.source, source) || other.source == source)&&const DeepCollectionEquality().equals(other.imageBytes, imageBytes)&&(identical(other.rotationDegrees, rotationDegrees) || other.rotationDegrees == rotationDegrees)&&(identical(other.excluded, excluded) || other.excluded == excluded)&&(identical(other.thumbnailPath, thumbnailPath) || other.thumbnailPath == thumbnailPath)&&(identical(other.enhancedContrast, enhancedContrast) || other.enhancedContrast == enhancedContrast)&&(identical(other.brightnessAdjust, brightnessAdjust) || other.brightnessAdjust == brightnessAdjust));
}


@override
int get hashCode => Object.hash(runtimeType,id,source,const DeepCollectionEquality().hash(imageBytes),rotationDegrees,excluded,thumbnailPath,enhancedContrast,brightnessAdjust);

@override
String toString() {
  return 'ScannedPage(id: $id, source: $source, imageBytes: $imageBytes, rotationDegrees: $rotationDegrees, excluded: $excluded, thumbnailPath: $thumbnailPath, enhancedContrast: $enhancedContrast, brightnessAdjust: $brightnessAdjust)';
}


}

/// @nodoc
abstract mixin class $ScannedPageCopyWith<$Res>  {
  factory $ScannedPageCopyWith(ScannedPage value, $Res Function(ScannedPage) _then) = _$ScannedPageCopyWithImpl;
@useResult
$Res call({
 String id, ScannedPageSource source, Uint8List imageBytes, int rotationDegrees, bool excluded, String? thumbnailPath, double? enhancedContrast, double? brightnessAdjust
});




}
/// @nodoc
class _$ScannedPageCopyWithImpl<$Res>
    implements $ScannedPageCopyWith<$Res> {
  _$ScannedPageCopyWithImpl(this._self, this._then);

  final ScannedPage _self;
  final $Res Function(ScannedPage) _then;

/// Create a copy of ScannedPage
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? source = null,Object? imageBytes = null,Object? rotationDegrees = null,Object? excluded = null,Object? thumbnailPath = freezed,Object? enhancedContrast = freezed,Object? brightnessAdjust = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,source: null == source ? _self.source : source // ignore: cast_nullable_to_non_nullable
as ScannedPageSource,imageBytes: null == imageBytes ? _self.imageBytes : imageBytes // ignore: cast_nullable_to_non_nullable
as Uint8List,rotationDegrees: null == rotationDegrees ? _self.rotationDegrees : rotationDegrees // ignore: cast_nullable_to_non_nullable
as int,excluded: null == excluded ? _self.excluded : excluded // ignore: cast_nullable_to_non_nullable
as bool,thumbnailPath: freezed == thumbnailPath ? _self.thumbnailPath : thumbnailPath // ignore: cast_nullable_to_non_nullable
as String?,enhancedContrast: freezed == enhancedContrast ? _self.enhancedContrast : enhancedContrast // ignore: cast_nullable_to_non_nullable
as double?,brightnessAdjust: freezed == brightnessAdjust ? _self.brightnessAdjust : brightnessAdjust // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}

}


/// Adds pattern-matching-related methods to [ScannedPage].
extension ScannedPagePatterns on ScannedPage {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ScannedPage value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ScannedPage() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ScannedPage value)  $default,){
final _that = this;
switch (_that) {
case _ScannedPage():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ScannedPage value)?  $default,){
final _that = this;
switch (_that) {
case _ScannedPage() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  ScannedPageSource source,  Uint8List imageBytes,  int rotationDegrees,  bool excluded,  String? thumbnailPath,  double? enhancedContrast,  double? brightnessAdjust)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ScannedPage() when $default != null:
return $default(_that.id,_that.source,_that.imageBytes,_that.rotationDegrees,_that.excluded,_that.thumbnailPath,_that.enhancedContrast,_that.brightnessAdjust);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  ScannedPageSource source,  Uint8List imageBytes,  int rotationDegrees,  bool excluded,  String? thumbnailPath,  double? enhancedContrast,  double? brightnessAdjust)  $default,) {final _that = this;
switch (_that) {
case _ScannedPage():
return $default(_that.id,_that.source,_that.imageBytes,_that.rotationDegrees,_that.excluded,_that.thumbnailPath,_that.enhancedContrast,_that.brightnessAdjust);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  ScannedPageSource source,  Uint8List imageBytes,  int rotationDegrees,  bool excluded,  String? thumbnailPath,  double? enhancedContrast,  double? brightnessAdjust)?  $default,) {final _that = this;
switch (_that) {
case _ScannedPage() when $default != null:
return $default(_that.id,_that.source,_that.imageBytes,_that.rotationDegrees,_that.excluded,_that.thumbnailPath,_that.enhancedContrast,_that.brightnessAdjust);case _:
  return null;

}
}

}

/// @nodoc


class _ScannedPage implements ScannedPage {
  const _ScannedPage({required this.id, required this.source, required this.imageBytes, this.rotationDegrees = 0, this.excluded = false, this.thumbnailPath, this.enhancedContrast, this.brightnessAdjust});
  

@override final  String id;
@override final  ScannedPageSource source;
@override final  Uint8List imageBytes;
@override@JsonKey() final  int rotationDegrees;
@override@JsonKey() final  bool excluded;
@override final  String? thumbnailPath;
@override final  double? enhancedContrast;
@override final  double? brightnessAdjust;

/// Create a copy of ScannedPage
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ScannedPageCopyWith<_ScannedPage> get copyWith => __$ScannedPageCopyWithImpl<_ScannedPage>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ScannedPage&&(identical(other.id, id) || other.id == id)&&(identical(other.source, source) || other.source == source)&&const DeepCollectionEquality().equals(other.imageBytes, imageBytes)&&(identical(other.rotationDegrees, rotationDegrees) || other.rotationDegrees == rotationDegrees)&&(identical(other.excluded, excluded) || other.excluded == excluded)&&(identical(other.thumbnailPath, thumbnailPath) || other.thumbnailPath == thumbnailPath)&&(identical(other.enhancedContrast, enhancedContrast) || other.enhancedContrast == enhancedContrast)&&(identical(other.brightnessAdjust, brightnessAdjust) || other.brightnessAdjust == brightnessAdjust));
}


@override
int get hashCode => Object.hash(runtimeType,id,source,const DeepCollectionEquality().hash(imageBytes),rotationDegrees,excluded,thumbnailPath,enhancedContrast,brightnessAdjust);

@override
String toString() {
  return 'ScannedPage(id: $id, source: $source, imageBytes: $imageBytes, rotationDegrees: $rotationDegrees, excluded: $excluded, thumbnailPath: $thumbnailPath, enhancedContrast: $enhancedContrast, brightnessAdjust: $brightnessAdjust)';
}


}

/// @nodoc
abstract mixin class _$ScannedPageCopyWith<$Res> implements $ScannedPageCopyWith<$Res> {
  factory _$ScannedPageCopyWith(_ScannedPage value, $Res Function(_ScannedPage) _then) = __$ScannedPageCopyWithImpl;
@override @useResult
$Res call({
 String id, ScannedPageSource source, Uint8List imageBytes, int rotationDegrees, bool excluded, String? thumbnailPath, double? enhancedContrast, double? brightnessAdjust
});




}
/// @nodoc
class __$ScannedPageCopyWithImpl<$Res>
    implements _$ScannedPageCopyWith<$Res> {
  __$ScannedPageCopyWithImpl(this._self, this._then);

  final _ScannedPage _self;
  final $Res Function(_ScannedPage) _then;

/// Create a copy of ScannedPage
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? source = null,Object? imageBytes = null,Object? rotationDegrees = null,Object? excluded = null,Object? thumbnailPath = freezed,Object? enhancedContrast = freezed,Object? brightnessAdjust = freezed,}) {
  return _then(_ScannedPage(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,source: null == source ? _self.source : source // ignore: cast_nullable_to_non_nullable
as ScannedPageSource,imageBytes: null == imageBytes ? _self.imageBytes : imageBytes // ignore: cast_nullable_to_non_nullable
as Uint8List,rotationDegrees: null == rotationDegrees ? _self.rotationDegrees : rotationDegrees // ignore: cast_nullable_to_non_nullable
as int,excluded: null == excluded ? _self.excluded : excluded // ignore: cast_nullable_to_non_nullable
as bool,thumbnailPath: freezed == thumbnailPath ? _self.thumbnailPath : thumbnailPath // ignore: cast_nullable_to_non_nullable
as String?,enhancedContrast: freezed == enhancedContrast ? _self.enhancedContrast : enhancedContrast // ignore: cast_nullable_to_non_nullable
as double?,brightnessAdjust: freezed == brightnessAdjust ? _self.brightnessAdjust : brightnessAdjust // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}


}

/// @nodoc
mixin _$ScanSession {

 String get id; List<ScannedPage> get pages; ScanSessionStatus get status; String? get uploadTitle; List<int>? get tagIds; int? get correspondentId; int? get documentTypeId; DateTime? get createdDate; String? get storagePath; String? get asn; String? get selectedPageId;@JsonKey(includeFromJson: false, includeToJson: false) Uint8List? get generatedPdfBytes;
/// Create a copy of ScanSession
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ScanSessionCopyWith<ScanSession> get copyWith => _$ScanSessionCopyWithImpl<ScanSession>(this as ScanSession, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ScanSession&&(identical(other.id, id) || other.id == id)&&const DeepCollectionEquality().equals(other.pages, pages)&&(identical(other.status, status) || other.status == status)&&(identical(other.uploadTitle, uploadTitle) || other.uploadTitle == uploadTitle)&&const DeepCollectionEquality().equals(other.tagIds, tagIds)&&(identical(other.correspondentId, correspondentId) || other.correspondentId == correspondentId)&&(identical(other.documentTypeId, documentTypeId) || other.documentTypeId == documentTypeId)&&(identical(other.createdDate, createdDate) || other.createdDate == createdDate)&&(identical(other.storagePath, storagePath) || other.storagePath == storagePath)&&(identical(other.asn, asn) || other.asn == asn)&&(identical(other.selectedPageId, selectedPageId) || other.selectedPageId == selectedPageId)&&const DeepCollectionEquality().equals(other.generatedPdfBytes, generatedPdfBytes));
}


@override
int get hashCode => Object.hash(runtimeType,id,const DeepCollectionEquality().hash(pages),status,uploadTitle,const DeepCollectionEquality().hash(tagIds),correspondentId,documentTypeId,createdDate,storagePath,asn,selectedPageId,const DeepCollectionEquality().hash(generatedPdfBytes));

@override
String toString() {
  return 'ScanSession(id: $id, pages: $pages, status: $status, uploadTitle: $uploadTitle, tagIds: $tagIds, correspondentId: $correspondentId, documentTypeId: $documentTypeId, createdDate: $createdDate, storagePath: $storagePath, asn: $asn, selectedPageId: $selectedPageId, generatedPdfBytes: $generatedPdfBytes)';
}


}

/// @nodoc
abstract mixin class $ScanSessionCopyWith<$Res>  {
  factory $ScanSessionCopyWith(ScanSession value, $Res Function(ScanSession) _then) = _$ScanSessionCopyWithImpl;
@useResult
$Res call({
 String id, List<ScannedPage> pages, ScanSessionStatus status, String? uploadTitle, List<int>? tagIds, int? correspondentId, int? documentTypeId, DateTime? createdDate, String? storagePath, String? asn, String? selectedPageId,@JsonKey(includeFromJson: false, includeToJson: false) Uint8List? generatedPdfBytes
});




}
/// @nodoc
class _$ScanSessionCopyWithImpl<$Res>
    implements $ScanSessionCopyWith<$Res> {
  _$ScanSessionCopyWithImpl(this._self, this._then);

  final ScanSession _self;
  final $Res Function(ScanSession) _then;

/// Create a copy of ScanSession
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? pages = null,Object? status = null,Object? uploadTitle = freezed,Object? tagIds = freezed,Object? correspondentId = freezed,Object? documentTypeId = freezed,Object? createdDate = freezed,Object? storagePath = freezed,Object? asn = freezed,Object? selectedPageId = freezed,Object? generatedPdfBytes = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,pages: null == pages ? _self.pages : pages // ignore: cast_nullable_to_non_nullable
as List<ScannedPage>,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as ScanSessionStatus,uploadTitle: freezed == uploadTitle ? _self.uploadTitle : uploadTitle // ignore: cast_nullable_to_non_nullable
as String?,tagIds: freezed == tagIds ? _self.tagIds : tagIds // ignore: cast_nullable_to_non_nullable
as List<int>?,correspondentId: freezed == correspondentId ? _self.correspondentId : correspondentId // ignore: cast_nullable_to_non_nullable
as int?,documentTypeId: freezed == documentTypeId ? _self.documentTypeId : documentTypeId // ignore: cast_nullable_to_non_nullable
as int?,createdDate: freezed == createdDate ? _self.createdDate : createdDate // ignore: cast_nullable_to_non_nullable
as DateTime?,storagePath: freezed == storagePath ? _self.storagePath : storagePath // ignore: cast_nullable_to_non_nullable
as String?,asn: freezed == asn ? _self.asn : asn // ignore: cast_nullable_to_non_nullable
as String?,selectedPageId: freezed == selectedPageId ? _self.selectedPageId : selectedPageId // ignore: cast_nullable_to_non_nullable
as String?,generatedPdfBytes: freezed == generatedPdfBytes ? _self.generatedPdfBytes : generatedPdfBytes // ignore: cast_nullable_to_non_nullable
as Uint8List?,
  ));
}

}


/// Adds pattern-matching-related methods to [ScanSession].
extension ScanSessionPatterns on ScanSession {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ScanSession value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ScanSession() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ScanSession value)  $default,){
final _that = this;
switch (_that) {
case _ScanSession():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ScanSession value)?  $default,){
final _that = this;
switch (_that) {
case _ScanSession() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  List<ScannedPage> pages,  ScanSessionStatus status,  String? uploadTitle,  List<int>? tagIds,  int? correspondentId,  int? documentTypeId,  DateTime? createdDate,  String? storagePath,  String? asn,  String? selectedPageId, @JsonKey(includeFromJson: false, includeToJson: false)  Uint8List? generatedPdfBytes)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ScanSession() when $default != null:
return $default(_that.id,_that.pages,_that.status,_that.uploadTitle,_that.tagIds,_that.correspondentId,_that.documentTypeId,_that.createdDate,_that.storagePath,_that.asn,_that.selectedPageId,_that.generatedPdfBytes);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  List<ScannedPage> pages,  ScanSessionStatus status,  String? uploadTitle,  List<int>? tagIds,  int? correspondentId,  int? documentTypeId,  DateTime? createdDate,  String? storagePath,  String? asn,  String? selectedPageId, @JsonKey(includeFromJson: false, includeToJson: false)  Uint8List? generatedPdfBytes)  $default,) {final _that = this;
switch (_that) {
case _ScanSession():
return $default(_that.id,_that.pages,_that.status,_that.uploadTitle,_that.tagIds,_that.correspondentId,_that.documentTypeId,_that.createdDate,_that.storagePath,_that.asn,_that.selectedPageId,_that.generatedPdfBytes);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  List<ScannedPage> pages,  ScanSessionStatus status,  String? uploadTitle,  List<int>? tagIds,  int? correspondentId,  int? documentTypeId,  DateTime? createdDate,  String? storagePath,  String? asn,  String? selectedPageId, @JsonKey(includeFromJson: false, includeToJson: false)  Uint8List? generatedPdfBytes)?  $default,) {final _that = this;
switch (_that) {
case _ScanSession() when $default != null:
return $default(_that.id,_that.pages,_that.status,_that.uploadTitle,_that.tagIds,_that.correspondentId,_that.documentTypeId,_that.createdDate,_that.storagePath,_that.asn,_that.selectedPageId,_that.generatedPdfBytes);case _:
  return null;

}
}

}

/// @nodoc


class _ScanSession implements ScanSession {
  const _ScanSession({required this.id, required final  List<ScannedPage> pages, this.status = ScanSessionStatus.idle, this.uploadTitle, final  List<int>? tagIds, this.correspondentId, this.documentTypeId, this.createdDate, this.storagePath, this.asn, this.selectedPageId, @JsonKey(includeFromJson: false, includeToJson: false) this.generatedPdfBytes}): _pages = pages,_tagIds = tagIds;
  

@override final  String id;
 final  List<ScannedPage> _pages;
@override List<ScannedPage> get pages {
  if (_pages is EqualUnmodifiableListView) return _pages;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_pages);
}

@override@JsonKey() final  ScanSessionStatus status;
@override final  String? uploadTitle;
 final  List<int>? _tagIds;
@override List<int>? get tagIds {
  final value = _tagIds;
  if (value == null) return null;
  if (_tagIds is EqualUnmodifiableListView) return _tagIds;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override final  int? correspondentId;
@override final  int? documentTypeId;
@override final  DateTime? createdDate;
@override final  String? storagePath;
@override final  String? asn;
@override final  String? selectedPageId;
@override@JsonKey(includeFromJson: false, includeToJson: false) final  Uint8List? generatedPdfBytes;

/// Create a copy of ScanSession
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ScanSessionCopyWith<_ScanSession> get copyWith => __$ScanSessionCopyWithImpl<_ScanSession>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ScanSession&&(identical(other.id, id) || other.id == id)&&const DeepCollectionEquality().equals(other._pages, _pages)&&(identical(other.status, status) || other.status == status)&&(identical(other.uploadTitle, uploadTitle) || other.uploadTitle == uploadTitle)&&const DeepCollectionEquality().equals(other._tagIds, _tagIds)&&(identical(other.correspondentId, correspondentId) || other.correspondentId == correspondentId)&&(identical(other.documentTypeId, documentTypeId) || other.documentTypeId == documentTypeId)&&(identical(other.createdDate, createdDate) || other.createdDate == createdDate)&&(identical(other.storagePath, storagePath) || other.storagePath == storagePath)&&(identical(other.asn, asn) || other.asn == asn)&&(identical(other.selectedPageId, selectedPageId) || other.selectedPageId == selectedPageId)&&const DeepCollectionEquality().equals(other.generatedPdfBytes, generatedPdfBytes));
}


@override
int get hashCode => Object.hash(runtimeType,id,const DeepCollectionEquality().hash(_pages),status,uploadTitle,const DeepCollectionEquality().hash(_tagIds),correspondentId,documentTypeId,createdDate,storagePath,asn,selectedPageId,const DeepCollectionEquality().hash(generatedPdfBytes));

@override
String toString() {
  return 'ScanSession(id: $id, pages: $pages, status: $status, uploadTitle: $uploadTitle, tagIds: $tagIds, correspondentId: $correspondentId, documentTypeId: $documentTypeId, createdDate: $createdDate, storagePath: $storagePath, asn: $asn, selectedPageId: $selectedPageId, generatedPdfBytes: $generatedPdfBytes)';
}


}

/// @nodoc
abstract mixin class _$ScanSessionCopyWith<$Res> implements $ScanSessionCopyWith<$Res> {
  factory _$ScanSessionCopyWith(_ScanSession value, $Res Function(_ScanSession) _then) = __$ScanSessionCopyWithImpl;
@override @useResult
$Res call({
 String id, List<ScannedPage> pages, ScanSessionStatus status, String? uploadTitle, List<int>? tagIds, int? correspondentId, int? documentTypeId, DateTime? createdDate, String? storagePath, String? asn, String? selectedPageId,@JsonKey(includeFromJson: false, includeToJson: false) Uint8List? generatedPdfBytes
});




}
/// @nodoc
class __$ScanSessionCopyWithImpl<$Res>
    implements _$ScanSessionCopyWith<$Res> {
  __$ScanSessionCopyWithImpl(this._self, this._then);

  final _ScanSession _self;
  final $Res Function(_ScanSession) _then;

/// Create a copy of ScanSession
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? pages = null,Object? status = null,Object? uploadTitle = freezed,Object? tagIds = freezed,Object? correspondentId = freezed,Object? documentTypeId = freezed,Object? createdDate = freezed,Object? storagePath = freezed,Object? asn = freezed,Object? selectedPageId = freezed,Object? generatedPdfBytes = freezed,}) {
  return _then(_ScanSession(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,pages: null == pages ? _self._pages : pages // ignore: cast_nullable_to_non_nullable
as List<ScannedPage>,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as ScanSessionStatus,uploadTitle: freezed == uploadTitle ? _self.uploadTitle : uploadTitle // ignore: cast_nullable_to_non_nullable
as String?,tagIds: freezed == tagIds ? _self._tagIds : tagIds // ignore: cast_nullable_to_non_nullable
as List<int>?,correspondentId: freezed == correspondentId ? _self.correspondentId : correspondentId // ignore: cast_nullable_to_non_nullable
as int?,documentTypeId: freezed == documentTypeId ? _self.documentTypeId : documentTypeId // ignore: cast_nullable_to_non_nullable
as int?,createdDate: freezed == createdDate ? _self.createdDate : createdDate // ignore: cast_nullable_to_non_nullable
as DateTime?,storagePath: freezed == storagePath ? _self.storagePath : storagePath // ignore: cast_nullable_to_non_nullable
as String?,asn: freezed == asn ? _self.asn : asn // ignore: cast_nullable_to_non_nullable
as String?,selectedPageId: freezed == selectedPageId ? _self.selectedPageId : selectedPageId // ignore: cast_nullable_to_non_nullable
as String?,generatedPdfBytes: freezed == generatedPdfBytes ? _self.generatedPdfBytes : generatedPdfBytes // ignore: cast_nullable_to_non_nullable
as Uint8List?,
  ));
}


}

// dart format on
