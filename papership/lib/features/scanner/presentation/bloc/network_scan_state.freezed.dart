// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'network_scan_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$NetworkScanState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NetworkScanState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'NetworkScanState()';
}


}

/// @nodoc
class $NetworkScanStateCopyWith<$Res>  {
$NetworkScanStateCopyWith(NetworkScanState _, $Res Function(NetworkScanState) __);
}


/// Adds pattern-matching-related methods to [NetworkScanState].
extension NetworkScanStatePatterns on NetworkScanState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Discovering value)?  discovering,TResult Function( _Discovered value)?  discovered,TResult Function( _SelectingSettings value)?  selectingSettings,TResult Function( _Scanning value)?  scanning,TResult Function( _Error value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Discovering() when discovering != null:
return discovering(_that);case _Discovered() when discovered != null:
return discovered(_that);case _SelectingSettings() when selectingSettings != null:
return selectingSettings(_that);case _Scanning() when scanning != null:
return scanning(_that);case _Error() when error != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Discovering value)  discovering,required TResult Function( _Discovered value)  discovered,required TResult Function( _SelectingSettings value)  selectingSettings,required TResult Function( _Scanning value)  scanning,required TResult Function( _Error value)  error,}){
final _that = this;
switch (_that) {
case _Discovering():
return discovering(_that);case _Discovered():
return discovered(_that);case _SelectingSettings():
return selectingSettings(_that);case _Scanning():
return scanning(_that);case _Error():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Discovering value)?  discovering,TResult? Function( _Discovered value)?  discovered,TResult? Function( _SelectingSettings value)?  selectingSettings,TResult? Function( _Scanning value)?  scanning,TResult? Function( _Error value)?  error,}){
final _that = this;
switch (_that) {
case _Discovering() when discovering != null:
return discovering(_that);case _Discovered() when discovered != null:
return discovered(_that);case _SelectingSettings() when selectingSettings != null:
return selectingSettings(_that);case _Scanning() when scanning != null:
return scanning(_that);case _Error() when error != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( List<DiscoveredScanner> scanners)?  discovering,TResult Function( List<DiscoveredScanner> scanners)?  discovered,TResult Function( DiscoveredScanner scanner,  List<DiscoveredScanner> scanners)?  selectingSettings,TResult Function( DiscoveredScanner scanner,  int pageCount)?  scanning,TResult Function( String message,  DiscoveredScanner? scanner)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Discovering() when discovering != null:
return discovering(_that.scanners);case _Discovered() when discovered != null:
return discovered(_that.scanners);case _SelectingSettings() when selectingSettings != null:
return selectingSettings(_that.scanner,_that.scanners);case _Scanning() when scanning != null:
return scanning(_that.scanner,_that.pageCount);case _Error() when error != null:
return error(_that.message,_that.scanner);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( List<DiscoveredScanner> scanners)  discovering,required TResult Function( List<DiscoveredScanner> scanners)  discovered,required TResult Function( DiscoveredScanner scanner,  List<DiscoveredScanner> scanners)  selectingSettings,required TResult Function( DiscoveredScanner scanner,  int pageCount)  scanning,required TResult Function( String message,  DiscoveredScanner? scanner)  error,}) {final _that = this;
switch (_that) {
case _Discovering():
return discovering(_that.scanners);case _Discovered():
return discovered(_that.scanners);case _SelectingSettings():
return selectingSettings(_that.scanner,_that.scanners);case _Scanning():
return scanning(_that.scanner,_that.pageCount);case _Error():
return error(_that.message,_that.scanner);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( List<DiscoveredScanner> scanners)?  discovering,TResult? Function( List<DiscoveredScanner> scanners)?  discovered,TResult? Function( DiscoveredScanner scanner,  List<DiscoveredScanner> scanners)?  selectingSettings,TResult? Function( DiscoveredScanner scanner,  int pageCount)?  scanning,TResult? Function( String message,  DiscoveredScanner? scanner)?  error,}) {final _that = this;
switch (_that) {
case _Discovering() when discovering != null:
return discovering(_that.scanners);case _Discovered() when discovered != null:
return discovered(_that.scanners);case _SelectingSettings() when selectingSettings != null:
return selectingSettings(_that.scanner,_that.scanners);case _Scanning() when scanning != null:
return scanning(_that.scanner,_that.pageCount);case _Error() when error != null:
return error(_that.message,_that.scanner);case _:
  return null;

}
}

}

/// @nodoc


class _Discovering implements NetworkScanState {
  const _Discovering({final  List<DiscoveredScanner> scanners = const []}): _scanners = scanners;
  

 final  List<DiscoveredScanner> _scanners;
@JsonKey() List<DiscoveredScanner> get scanners {
  if (_scanners is EqualUnmodifiableListView) return _scanners;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_scanners);
}


/// Create a copy of NetworkScanState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DiscoveringCopyWith<_Discovering> get copyWith => __$DiscoveringCopyWithImpl<_Discovering>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Discovering&&const DeepCollectionEquality().equals(other._scanners, _scanners));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_scanners));

@override
String toString() {
  return 'NetworkScanState.discovering(scanners: $scanners)';
}


}

/// @nodoc
abstract mixin class _$DiscoveringCopyWith<$Res> implements $NetworkScanStateCopyWith<$Res> {
  factory _$DiscoveringCopyWith(_Discovering value, $Res Function(_Discovering) _then) = __$DiscoveringCopyWithImpl;
@useResult
$Res call({
 List<DiscoveredScanner> scanners
});




}
/// @nodoc
class __$DiscoveringCopyWithImpl<$Res>
    implements _$DiscoveringCopyWith<$Res> {
  __$DiscoveringCopyWithImpl(this._self, this._then);

  final _Discovering _self;
  final $Res Function(_Discovering) _then;

/// Create a copy of NetworkScanState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? scanners = null,}) {
  return _then(_Discovering(
scanners: null == scanners ? _self._scanners : scanners // ignore: cast_nullable_to_non_nullable
as List<DiscoveredScanner>,
  ));
}


}

/// @nodoc


class _Discovered implements NetworkScanState {
  const _Discovered(final  List<DiscoveredScanner> scanners): _scanners = scanners;
  

 final  List<DiscoveredScanner> _scanners;
 List<DiscoveredScanner> get scanners {
  if (_scanners is EqualUnmodifiableListView) return _scanners;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_scanners);
}


/// Create a copy of NetworkScanState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DiscoveredCopyWith<_Discovered> get copyWith => __$DiscoveredCopyWithImpl<_Discovered>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Discovered&&const DeepCollectionEquality().equals(other._scanners, _scanners));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_scanners));

@override
String toString() {
  return 'NetworkScanState.discovered(scanners: $scanners)';
}


}

/// @nodoc
abstract mixin class _$DiscoveredCopyWith<$Res> implements $NetworkScanStateCopyWith<$Res> {
  factory _$DiscoveredCopyWith(_Discovered value, $Res Function(_Discovered) _then) = __$DiscoveredCopyWithImpl;
@useResult
$Res call({
 List<DiscoveredScanner> scanners
});




}
/// @nodoc
class __$DiscoveredCopyWithImpl<$Res>
    implements _$DiscoveredCopyWith<$Res> {
  __$DiscoveredCopyWithImpl(this._self, this._then);

  final _Discovered _self;
  final $Res Function(_Discovered) _then;

/// Create a copy of NetworkScanState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? scanners = null,}) {
  return _then(_Discovered(
null == scanners ? _self._scanners : scanners // ignore: cast_nullable_to_non_nullable
as List<DiscoveredScanner>,
  ));
}


}

/// @nodoc


class _SelectingSettings implements NetworkScanState {
  const _SelectingSettings(this.scanner, final  List<DiscoveredScanner> scanners): _scanners = scanners;
  

 final  DiscoveredScanner scanner;
 final  List<DiscoveredScanner> _scanners;
 List<DiscoveredScanner> get scanners {
  if (_scanners is EqualUnmodifiableListView) return _scanners;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_scanners);
}


/// Create a copy of NetworkScanState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SelectingSettingsCopyWith<_SelectingSettings> get copyWith => __$SelectingSettingsCopyWithImpl<_SelectingSettings>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SelectingSettings&&(identical(other.scanner, scanner) || other.scanner == scanner)&&const DeepCollectionEquality().equals(other._scanners, _scanners));
}


@override
int get hashCode => Object.hash(runtimeType,scanner,const DeepCollectionEquality().hash(_scanners));

@override
String toString() {
  return 'NetworkScanState.selectingSettings(scanner: $scanner, scanners: $scanners)';
}


}

/// @nodoc
abstract mixin class _$SelectingSettingsCopyWith<$Res> implements $NetworkScanStateCopyWith<$Res> {
  factory _$SelectingSettingsCopyWith(_SelectingSettings value, $Res Function(_SelectingSettings) _then) = __$SelectingSettingsCopyWithImpl;
@useResult
$Res call({
 DiscoveredScanner scanner, List<DiscoveredScanner> scanners
});


$DiscoveredScannerCopyWith<$Res> get scanner;

}
/// @nodoc
class __$SelectingSettingsCopyWithImpl<$Res>
    implements _$SelectingSettingsCopyWith<$Res> {
  __$SelectingSettingsCopyWithImpl(this._self, this._then);

  final _SelectingSettings _self;
  final $Res Function(_SelectingSettings) _then;

/// Create a copy of NetworkScanState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? scanner = null,Object? scanners = null,}) {
  return _then(_SelectingSettings(
null == scanner ? _self.scanner : scanner // ignore: cast_nullable_to_non_nullable
as DiscoveredScanner,null == scanners ? _self._scanners : scanners // ignore: cast_nullable_to_non_nullable
as List<DiscoveredScanner>,
  ));
}

/// Create a copy of NetworkScanState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DiscoveredScannerCopyWith<$Res> get scanner {
  
  return $DiscoveredScannerCopyWith<$Res>(_self.scanner, (value) {
    return _then(_self.copyWith(scanner: value));
  });
}
}

/// @nodoc


class _Scanning implements NetworkScanState {
  const _Scanning(this.scanner, this.pageCount);
  

 final  DiscoveredScanner scanner;
 final  int pageCount;

/// Create a copy of NetworkScanState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ScanningCopyWith<_Scanning> get copyWith => __$ScanningCopyWithImpl<_Scanning>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Scanning&&(identical(other.scanner, scanner) || other.scanner == scanner)&&(identical(other.pageCount, pageCount) || other.pageCount == pageCount));
}


@override
int get hashCode => Object.hash(runtimeType,scanner,pageCount);

@override
String toString() {
  return 'NetworkScanState.scanning(scanner: $scanner, pageCount: $pageCount)';
}


}

/// @nodoc
abstract mixin class _$ScanningCopyWith<$Res> implements $NetworkScanStateCopyWith<$Res> {
  factory _$ScanningCopyWith(_Scanning value, $Res Function(_Scanning) _then) = __$ScanningCopyWithImpl;
@useResult
$Res call({
 DiscoveredScanner scanner, int pageCount
});


$DiscoveredScannerCopyWith<$Res> get scanner;

}
/// @nodoc
class __$ScanningCopyWithImpl<$Res>
    implements _$ScanningCopyWith<$Res> {
  __$ScanningCopyWithImpl(this._self, this._then);

  final _Scanning _self;
  final $Res Function(_Scanning) _then;

/// Create a copy of NetworkScanState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? scanner = null,Object? pageCount = null,}) {
  return _then(_Scanning(
null == scanner ? _self.scanner : scanner // ignore: cast_nullable_to_non_nullable
as DiscoveredScanner,null == pageCount ? _self.pageCount : pageCount // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

/// Create a copy of NetworkScanState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DiscoveredScannerCopyWith<$Res> get scanner {
  
  return $DiscoveredScannerCopyWith<$Res>(_self.scanner, (value) {
    return _then(_self.copyWith(scanner: value));
  });
}
}

/// @nodoc


class _Error implements NetworkScanState {
  const _Error(this.message, this.scanner);
  

 final  String message;
 final  DiscoveredScanner? scanner;

/// Create a copy of NetworkScanState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ErrorCopyWith<_Error> get copyWith => __$ErrorCopyWithImpl<_Error>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Error&&(identical(other.message, message) || other.message == message)&&(identical(other.scanner, scanner) || other.scanner == scanner));
}


@override
int get hashCode => Object.hash(runtimeType,message,scanner);

@override
String toString() {
  return 'NetworkScanState.error(message: $message, scanner: $scanner)';
}


}

/// @nodoc
abstract mixin class _$ErrorCopyWith<$Res> implements $NetworkScanStateCopyWith<$Res> {
  factory _$ErrorCopyWith(_Error value, $Res Function(_Error) _then) = __$ErrorCopyWithImpl;
@useResult
$Res call({
 String message, DiscoveredScanner? scanner
});


$DiscoveredScannerCopyWith<$Res>? get scanner;

}
/// @nodoc
class __$ErrorCopyWithImpl<$Res>
    implements _$ErrorCopyWith<$Res> {
  __$ErrorCopyWithImpl(this._self, this._then);

  final _Error _self;
  final $Res Function(_Error) _then;

/// Create a copy of NetworkScanState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,Object? scanner = freezed,}) {
  return _then(_Error(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,freezed == scanner ? _self.scanner : scanner // ignore: cast_nullable_to_non_nullable
as DiscoveredScanner?,
  ));
}

/// Create a copy of NetworkScanState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DiscoveredScannerCopyWith<$Res>? get scanner {
    if (_self.scanner == null) {
    return null;
  }

  return $DiscoveredScannerCopyWith<$Res>(_self.scanner!, (value) {
    return _then(_self.copyWith(scanner: value));
  });
}
}

// dart format on
