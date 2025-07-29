// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'detail_story_result.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DetailStoryResult {

 bool get error; String get message; Story get story;
/// Create a copy of DetailStoryResult
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DetailStoryResultCopyWith<DetailStoryResult> get copyWith => _$DetailStoryResultCopyWithImpl<DetailStoryResult>(this as DetailStoryResult, _$identity);

  /// Serializes this DetailStoryResult to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DetailStoryResult&&(identical(other.error, error) || other.error == error)&&(identical(other.message, message) || other.message == message)&&(identical(other.story, story) || other.story == story));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,error,message,story);

@override
String toString() {
  return 'DetailStoryResult(error: $error, message: $message, story: $story)';
}


}

/// @nodoc
abstract mixin class $DetailStoryResultCopyWith<$Res>  {
  factory $DetailStoryResultCopyWith(DetailStoryResult value, $Res Function(DetailStoryResult) _then) = _$DetailStoryResultCopyWithImpl;
@useResult
$Res call({
 bool error, String message, Story story
});


$StoryCopyWith<$Res> get story;

}
/// @nodoc
class _$DetailStoryResultCopyWithImpl<$Res>
    implements $DetailStoryResultCopyWith<$Res> {
  _$DetailStoryResultCopyWithImpl(this._self, this._then);

  final DetailStoryResult _self;
  final $Res Function(DetailStoryResult) _then;

/// Create a copy of DetailStoryResult
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? error = null,Object? message = null,Object? story = null,}) {
  return _then(_self.copyWith(
error: null == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as bool,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,story: null == story ? _self.story : story // ignore: cast_nullable_to_non_nullable
as Story,
  ));
}
/// Create a copy of DetailStoryResult
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$StoryCopyWith<$Res> get story {
  
  return $StoryCopyWith<$Res>(_self.story, (value) {
    return _then(_self.copyWith(story: value));
  });
}
}


/// Adds pattern-matching-related methods to [DetailStoryResult].
extension DetailStoryResultPatterns on DetailStoryResult {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DetailStoryResult value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DetailStoryResult() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DetailStoryResult value)  $default,){
final _that = this;
switch (_that) {
case _DetailStoryResult():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DetailStoryResult value)?  $default,){
final _that = this;
switch (_that) {
case _DetailStoryResult() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool error,  String message,  Story story)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DetailStoryResult() when $default != null:
return $default(_that.error,_that.message,_that.story);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool error,  String message,  Story story)  $default,) {final _that = this;
switch (_that) {
case _DetailStoryResult():
return $default(_that.error,_that.message,_that.story);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool error,  String message,  Story story)?  $default,) {final _that = this;
switch (_that) {
case _DetailStoryResult() when $default != null:
return $default(_that.error,_that.message,_that.story);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DetailStoryResult implements DetailStoryResult {
  const _DetailStoryResult({required this.error, required this.message, required this.story});
  factory _DetailStoryResult.fromJson(Map<String, dynamic> json) => _$DetailStoryResultFromJson(json);

@override final  bool error;
@override final  String message;
@override final  Story story;

/// Create a copy of DetailStoryResult
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DetailStoryResultCopyWith<_DetailStoryResult> get copyWith => __$DetailStoryResultCopyWithImpl<_DetailStoryResult>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DetailStoryResultToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DetailStoryResult&&(identical(other.error, error) || other.error == error)&&(identical(other.message, message) || other.message == message)&&(identical(other.story, story) || other.story == story));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,error,message,story);

@override
String toString() {
  return 'DetailStoryResult(error: $error, message: $message, story: $story)';
}


}

/// @nodoc
abstract mixin class _$DetailStoryResultCopyWith<$Res> implements $DetailStoryResultCopyWith<$Res> {
  factory _$DetailStoryResultCopyWith(_DetailStoryResult value, $Res Function(_DetailStoryResult) _then) = __$DetailStoryResultCopyWithImpl;
@override @useResult
$Res call({
 bool error, String message, Story story
});


@override $StoryCopyWith<$Res> get story;

}
/// @nodoc
class __$DetailStoryResultCopyWithImpl<$Res>
    implements _$DetailStoryResultCopyWith<$Res> {
  __$DetailStoryResultCopyWithImpl(this._self, this._then);

  final _DetailStoryResult _self;
  final $Res Function(_DetailStoryResult) _then;

/// Create a copy of DetailStoryResult
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? error = null,Object? message = null,Object? story = null,}) {
  return _then(_DetailStoryResult(
error: null == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as bool,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,story: null == story ? _self.story : story // ignore: cast_nullable_to_non_nullable
as Story,
  ));
}

/// Create a copy of DetailStoryResult
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$StoryCopyWith<$Res> get story {
  
  return $StoryCopyWith<$Res>(_self.story, (value) {
    return _then(_self.copyWith(story: value));
  });
}
}

// dart format on
