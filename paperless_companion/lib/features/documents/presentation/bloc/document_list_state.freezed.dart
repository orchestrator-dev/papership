// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'document_list_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
DocumentListState _$DocumentListStateFromJson(
  Map<String, dynamic> json
) {
        switch (json['runtimeType']) {
                  case 'initial':
          return _Initial.fromJson(
            json
          );
                case 'loading':
          return _Loading.fromJson(
            json
          );
                case 'loaded':
          return _Loaded.fromJson(
            json
          );
                case 'error':
          return _Error.fromJson(
            json
          );
        
          default:
            throw CheckedFromJsonException(
  json,
  'runtimeType',
  'DocumentListState',
  'Invalid union type "${json['runtimeType']}"!'
);
        }
      
}

/// @nodoc
mixin _$DocumentListState {



  /// Serializes this DocumentListState to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DocumentListState);
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'DocumentListState()';
}


}

/// @nodoc
class $DocumentListStateCopyWith<$Res>  {
$DocumentListStateCopyWith(DocumentListState _, $Res Function(DocumentListState) __);
}


/// Adds pattern-matching-related methods to [DocumentListState].
extension DocumentListStatePatterns on DocumentListState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Initial value)?  initial,TResult Function( _Loading value)?  loading,TResult Function( _Loaded value)?  loaded,TResult Function( _Error value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _Loading() when loading != null:
return loading(_that);case _Loaded() when loaded != null:
return loaded(_that);case _Error() when error != null:
return error(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Initial value)  initial,required TResult Function( _Loading value)  loading,required TResult Function( _Loaded value)  loaded,required TResult Function( _Error value)  error,}){
final _that = this;
switch (_that) {
case _Initial():
return initial(_that);case _Loading():
return loading(_that);case _Loaded():
return loaded(_that);case _Error():
return error(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Initial value)?  initial,TResult? Function( _Loading value)?  loading,TResult? Function( _Loaded value)?  loaded,TResult? Function( _Error value)?  error,}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _Loading() when loading != null:
return loading(_that);case _Loaded() when loaded != null:
return loaded(_that);case _Error() when error != null:
return error(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function( List<Document> documents,  DocumentFilter filter)?  loading,TResult Function( List<Document> documents,  DocumentFilter filter,  bool hasMore)?  loaded,TResult Function( String message,  DocumentFilter filter,  List<Document> documents)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case _Loading() when loading != null:
return loading(_that.documents,_that.filter);case _Loaded() when loaded != null:
return loaded(_that.documents,_that.filter,_that.hasMore);case _Error() when error != null:
return error(_that.message,_that.filter,_that.documents);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function( List<Document> documents,  DocumentFilter filter)  loading,required TResult Function( List<Document> documents,  DocumentFilter filter,  bool hasMore)  loaded,required TResult Function( String message,  DocumentFilter filter,  List<Document> documents)  error,}) {final _that = this;
switch (_that) {
case _Initial():
return initial();case _Loading():
return loading(_that.documents,_that.filter);case _Loaded():
return loaded(_that.documents,_that.filter,_that.hasMore);case _Error():
return error(_that.message,_that.filter,_that.documents);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function( List<Document> documents,  DocumentFilter filter)?  loading,TResult? Function( List<Document> documents,  DocumentFilter filter,  bool hasMore)?  loaded,TResult? Function( String message,  DocumentFilter filter,  List<Document> documents)?  error,}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case _Loading() when loading != null:
return loading(_that.documents,_that.filter);case _Loaded() when loaded != null:
return loaded(_that.documents,_that.filter,_that.hasMore);case _Error() when error != null:
return error(_that.message,_that.filter,_that.documents);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Initial implements DocumentListState {
  const _Initial({final  String? $type}): $type = $type ?? 'initial';
  factory _Initial.fromJson(Map<String, dynamic> json) => _$InitialFromJson(json);



@JsonKey(name: 'runtimeType')
final String $type;



@override
Map<String, dynamic> toJson() {
  return _$InitialToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Initial);
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'DocumentListState.initial()';
}


}




/// @nodoc
@JsonSerializable()

class _Loading implements DocumentListState {
  const _Loading({final  List<Document> documents = const [], required this.filter, final  String? $type}): _documents = documents,$type = $type ?? 'loading';
  factory _Loading.fromJson(Map<String, dynamic> json) => _$LoadingFromJson(json);

 final  List<Document> _documents;
@JsonKey() List<Document> get documents {
  if (_documents is EqualUnmodifiableListView) return _documents;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_documents);
}

 final  DocumentFilter filter;

@JsonKey(name: 'runtimeType')
final String $type;


/// Create a copy of DocumentListState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LoadingCopyWith<_Loading> get copyWith => __$LoadingCopyWithImpl<_Loading>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$LoadingToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Loading&&const DeepCollectionEquality().equals(other._documents, _documents)&&(identical(other.filter, filter) || other.filter == filter));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_documents),filter);

@override
String toString() {
  return 'DocumentListState.loading(documents: $documents, filter: $filter)';
}


}

/// @nodoc
abstract mixin class _$LoadingCopyWith<$Res> implements $DocumentListStateCopyWith<$Res> {
  factory _$LoadingCopyWith(_Loading value, $Res Function(_Loading) _then) = __$LoadingCopyWithImpl;
@useResult
$Res call({
 List<Document> documents, DocumentFilter filter
});


$DocumentFilterCopyWith<$Res> get filter;

}
/// @nodoc
class __$LoadingCopyWithImpl<$Res>
    implements _$LoadingCopyWith<$Res> {
  __$LoadingCopyWithImpl(this._self, this._then);

  final _Loading _self;
  final $Res Function(_Loading) _then;

/// Create a copy of DocumentListState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? documents = null,Object? filter = null,}) {
  return _then(_Loading(
documents: null == documents ? _self._documents : documents // ignore: cast_nullable_to_non_nullable
as List<Document>,filter: null == filter ? _self.filter : filter // ignore: cast_nullable_to_non_nullable
as DocumentFilter,
  ));
}

/// Create a copy of DocumentListState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DocumentFilterCopyWith<$Res> get filter {
  
  return $DocumentFilterCopyWith<$Res>(_self.filter, (value) {
    return _then(_self.copyWith(filter: value));
  });
}
}

/// @nodoc
@JsonSerializable()

class _Loaded implements DocumentListState {
  const _Loaded({required final  List<Document> documents, required this.filter, required this.hasMore, final  String? $type}): _documents = documents,$type = $type ?? 'loaded';
  factory _Loaded.fromJson(Map<String, dynamic> json) => _$LoadedFromJson(json);

 final  List<Document> _documents;
 List<Document> get documents {
  if (_documents is EqualUnmodifiableListView) return _documents;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_documents);
}

 final  DocumentFilter filter;
 final  bool hasMore;

@JsonKey(name: 'runtimeType')
final String $type;


/// Create a copy of DocumentListState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LoadedCopyWith<_Loaded> get copyWith => __$LoadedCopyWithImpl<_Loaded>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$LoadedToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Loaded&&const DeepCollectionEquality().equals(other._documents, _documents)&&(identical(other.filter, filter) || other.filter == filter)&&(identical(other.hasMore, hasMore) || other.hasMore == hasMore));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_documents),filter,hasMore);

@override
String toString() {
  return 'DocumentListState.loaded(documents: $documents, filter: $filter, hasMore: $hasMore)';
}


}

/// @nodoc
abstract mixin class _$LoadedCopyWith<$Res> implements $DocumentListStateCopyWith<$Res> {
  factory _$LoadedCopyWith(_Loaded value, $Res Function(_Loaded) _then) = __$LoadedCopyWithImpl;
@useResult
$Res call({
 List<Document> documents, DocumentFilter filter, bool hasMore
});


$DocumentFilterCopyWith<$Res> get filter;

}
/// @nodoc
class __$LoadedCopyWithImpl<$Res>
    implements _$LoadedCopyWith<$Res> {
  __$LoadedCopyWithImpl(this._self, this._then);

  final _Loaded _self;
  final $Res Function(_Loaded) _then;

/// Create a copy of DocumentListState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? documents = null,Object? filter = null,Object? hasMore = null,}) {
  return _then(_Loaded(
documents: null == documents ? _self._documents : documents // ignore: cast_nullable_to_non_nullable
as List<Document>,filter: null == filter ? _self.filter : filter // ignore: cast_nullable_to_non_nullable
as DocumentFilter,hasMore: null == hasMore ? _self.hasMore : hasMore // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

/// Create a copy of DocumentListState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DocumentFilterCopyWith<$Res> get filter {
  
  return $DocumentFilterCopyWith<$Res>(_self.filter, (value) {
    return _then(_self.copyWith(filter: value));
  });
}
}

/// @nodoc
@JsonSerializable()

class _Error implements DocumentListState {
  const _Error({required this.message, required this.filter, final  List<Document> documents = const [], final  String? $type}): _documents = documents,$type = $type ?? 'error';
  factory _Error.fromJson(Map<String, dynamic> json) => _$ErrorFromJson(json);

 final  String message;
 final  DocumentFilter filter;
 final  List<Document> _documents;
@JsonKey() List<Document> get documents {
  if (_documents is EqualUnmodifiableListView) return _documents;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_documents);
}


@JsonKey(name: 'runtimeType')
final String $type;


/// Create a copy of DocumentListState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ErrorCopyWith<_Error> get copyWith => __$ErrorCopyWithImpl<_Error>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ErrorToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Error&&(identical(other.message, message) || other.message == message)&&(identical(other.filter, filter) || other.filter == filter)&&const DeepCollectionEquality().equals(other._documents, _documents));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,message,filter,const DeepCollectionEquality().hash(_documents));

@override
String toString() {
  return 'DocumentListState.error(message: $message, filter: $filter, documents: $documents)';
}


}

/// @nodoc
abstract mixin class _$ErrorCopyWith<$Res> implements $DocumentListStateCopyWith<$Res> {
  factory _$ErrorCopyWith(_Error value, $Res Function(_Error) _then) = __$ErrorCopyWithImpl;
@useResult
$Res call({
 String message, DocumentFilter filter, List<Document> documents
});


$DocumentFilterCopyWith<$Res> get filter;

}
/// @nodoc
class __$ErrorCopyWithImpl<$Res>
    implements _$ErrorCopyWith<$Res> {
  __$ErrorCopyWithImpl(this._self, this._then);

  final _Error _self;
  final $Res Function(_Error) _then;

/// Create a copy of DocumentListState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,Object? filter = null,Object? documents = null,}) {
  return _then(_Error(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,filter: null == filter ? _self.filter : filter // ignore: cast_nullable_to_non_nullable
as DocumentFilter,documents: null == documents ? _self._documents : documents // ignore: cast_nullable_to_non_nullable
as List<Document>,
  ));
}

/// Create a copy of DocumentListState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DocumentFilterCopyWith<$Res> get filter {
  
  return $DocumentFilterCopyWith<$Res>(_self.filter, (value) {
    return _then(_self.copyWith(filter: value));
  });
}
}

// dart format on
