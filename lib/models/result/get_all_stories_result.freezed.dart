// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'get_all_stories_result.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$GetAllStoriesResult {

 bool get error; String get message; List<Story> get listStory;
/// Create a copy of GetAllStoriesResult
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GetAllStoriesResultCopyWith<GetAllStoriesResult> get copyWith => _$GetAllStoriesResultCopyWithImpl<GetAllStoriesResult>(this as GetAllStoriesResult, _$identity);

  /// Serializes this GetAllStoriesResult to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GetAllStoriesResult&&(identical(other.error, error) || other.error == error)&&(identical(other.message, message) || other.message == message)&&const DeepCollectionEquality().equals(other.listStory, listStory));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,error,message,const DeepCollectionEquality().hash(listStory));

@override
String toString() {
  return 'GetAllStoriesResult(error: $error, message: $message, listStory: $listStory)';
}


}

/// @nodoc
abstract mixin class $GetAllStoriesResultCopyWith<$Res>  {
  factory $GetAllStoriesResultCopyWith(GetAllStoriesResult value, $Res Function(GetAllStoriesResult) _then) = _$GetAllStoriesResultCopyWithImpl;
@useResult
$Res call({
 bool error, String message, List<Story> listStory
});




}
/// @nodoc
class _$GetAllStoriesResultCopyWithImpl<$Res>
    implements $GetAllStoriesResultCopyWith<$Res> {
  _$GetAllStoriesResultCopyWithImpl(this._self, this._then);

  final GetAllStoriesResult _self;
  final $Res Function(GetAllStoriesResult) _then;

/// Create a copy of GetAllStoriesResult
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? error = null,Object? message = null,Object? listStory = null,}) {
  return _then(_self.copyWith(
error: null == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as bool,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,listStory: null == listStory ? _self.listStory : listStory // ignore: cast_nullable_to_non_nullable
as List<Story>,
  ));
}

}


/// Adds pattern-matching-related methods to [GetAllStoriesResult].
extension GetAllStoriesResultPatterns on GetAllStoriesResult {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _GetAllStoriesResult value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GetAllStoriesResult() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _GetAllStoriesResult value)  $default,){
final _that = this;
switch (_that) {
case _GetAllStoriesResult():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _GetAllStoriesResult value)?  $default,){
final _that = this;
switch (_that) {
case _GetAllStoriesResult() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool error,  String message,  List<Story> listStory)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _GetAllStoriesResult() when $default != null:
return $default(_that.error,_that.message,_that.listStory);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool error,  String message,  List<Story> listStory)  $default,) {final _that = this;
switch (_that) {
case _GetAllStoriesResult():
return $default(_that.error,_that.message,_that.listStory);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool error,  String message,  List<Story> listStory)?  $default,) {final _that = this;
switch (_that) {
case _GetAllStoriesResult() when $default != null:
return $default(_that.error,_that.message,_that.listStory);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _GetAllStoriesResult implements GetAllStoriesResult {
  const _GetAllStoriesResult({required this.error, required this.message, required final  List<Story> listStory}): _listStory = listStory;
  factory _GetAllStoriesResult.fromJson(Map<String, dynamic> json) => _$GetAllStoriesResultFromJson(json);

@override final  bool error;
@override final  String message;
 final  List<Story> _listStory;
@override List<Story> get listStory {
  if (_listStory is EqualUnmodifiableListView) return _listStory;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_listStory);
}


/// Create a copy of GetAllStoriesResult
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GetAllStoriesResultCopyWith<_GetAllStoriesResult> get copyWith => __$GetAllStoriesResultCopyWithImpl<_GetAllStoriesResult>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$GetAllStoriesResultToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GetAllStoriesResult&&(identical(other.error, error) || other.error == error)&&(identical(other.message, message) || other.message == message)&&const DeepCollectionEquality().equals(other._listStory, _listStory));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,error,message,const DeepCollectionEquality().hash(_listStory));

@override
String toString() {
  return 'GetAllStoriesResult(error: $error, message: $message, listStory: $listStory)';
}


}

/// @nodoc
abstract mixin class _$GetAllStoriesResultCopyWith<$Res> implements $GetAllStoriesResultCopyWith<$Res> {
  factory _$GetAllStoriesResultCopyWith(_GetAllStoriesResult value, $Res Function(_GetAllStoriesResult) _then) = __$GetAllStoriesResultCopyWithImpl;
@override @useResult
$Res call({
 bool error, String message, List<Story> listStory
});




}
/// @nodoc
class __$GetAllStoriesResultCopyWithImpl<$Res>
    implements _$GetAllStoriesResultCopyWith<$Res> {
  __$GetAllStoriesResultCopyWithImpl(this._self, this._then);

  final _GetAllStoriesResult _self;
  final $Res Function(_GetAllStoriesResult) _then;

/// Create a copy of GetAllStoriesResult
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? error = null,Object? message = null,Object? listStory = null,}) {
  return _then(_GetAllStoriesResult(
error: null == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as bool,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,listStory: null == listStory ? _self._listStory : listStory // ignore: cast_nullable_to_non_nullable
as List<Story>,
  ));
}


}

// dart format on
