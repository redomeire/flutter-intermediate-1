// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'add_new_story_result.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AddNewStoryResult {

 bool get error; String get message;
/// Create a copy of AddNewStoryResult
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AddNewStoryResultCopyWith<AddNewStoryResult> get copyWith => _$AddNewStoryResultCopyWithImpl<AddNewStoryResult>(this as AddNewStoryResult, _$identity);

  /// Serializes this AddNewStoryResult to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AddNewStoryResult&&(identical(other.error, error) || other.error == error)&&(identical(other.message, message) || other.message == message));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,error,message);

@override
String toString() {
  return 'AddNewStoryResult(error: $error, message: $message)';
}


}

/// @nodoc
abstract mixin class $AddNewStoryResultCopyWith<$Res>  {
  factory $AddNewStoryResultCopyWith(AddNewStoryResult value, $Res Function(AddNewStoryResult) _then) = _$AddNewStoryResultCopyWithImpl;
@useResult
$Res call({
 bool error, String message
});




}
/// @nodoc
class _$AddNewStoryResultCopyWithImpl<$Res>
    implements $AddNewStoryResultCopyWith<$Res> {
  _$AddNewStoryResultCopyWithImpl(this._self, this._then);

  final AddNewStoryResult _self;
  final $Res Function(AddNewStoryResult) _then;

/// Create a copy of AddNewStoryResult
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? error = null,Object? message = null,}) {
  return _then(_self.copyWith(
error: null == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as bool,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [AddNewStoryResult].
extension AddNewStoryResultPatterns on AddNewStoryResult {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AddNewStoryResult value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AddNewStoryResult() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AddNewStoryResult value)  $default,){
final _that = this;
switch (_that) {
case _AddNewStoryResult():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AddNewStoryResult value)?  $default,){
final _that = this;
switch (_that) {
case _AddNewStoryResult() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool error,  String message)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AddNewStoryResult() when $default != null:
return $default(_that.error,_that.message);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool error,  String message)  $default,) {final _that = this;
switch (_that) {
case _AddNewStoryResult():
return $default(_that.error,_that.message);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool error,  String message)?  $default,) {final _that = this;
switch (_that) {
case _AddNewStoryResult() when $default != null:
return $default(_that.error,_that.message);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AddNewStoryResult implements AddNewStoryResult {
  const _AddNewStoryResult({required this.error, required this.message});
  factory _AddNewStoryResult.fromJson(Map<String, dynamic> json) => _$AddNewStoryResultFromJson(json);

@override final  bool error;
@override final  String message;

/// Create a copy of AddNewStoryResult
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AddNewStoryResultCopyWith<_AddNewStoryResult> get copyWith => __$AddNewStoryResultCopyWithImpl<_AddNewStoryResult>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AddNewStoryResultToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AddNewStoryResult&&(identical(other.error, error) || other.error == error)&&(identical(other.message, message) || other.message == message));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,error,message);

@override
String toString() {
  return 'AddNewStoryResult(error: $error, message: $message)';
}


}

/// @nodoc
abstract mixin class _$AddNewStoryResultCopyWith<$Res> implements $AddNewStoryResultCopyWith<$Res> {
  factory _$AddNewStoryResultCopyWith(_AddNewStoryResult value, $Res Function(_AddNewStoryResult) _then) = __$AddNewStoryResultCopyWithImpl;
@override @useResult
$Res call({
 bool error, String message
});




}
/// @nodoc
class __$AddNewStoryResultCopyWithImpl<$Res>
    implements _$AddNewStoryResultCopyWith<$Res> {
  __$AddNewStoryResultCopyWithImpl(this._self, this._then);

  final _AddNewStoryResult _self;
  final $Res Function(_AddNewStoryResult) _then;

/// Create a copy of AddNewStoryResult
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? error = null,Object? message = null,}) {
  return _then(_AddNewStoryResult(
error: null == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as bool,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
