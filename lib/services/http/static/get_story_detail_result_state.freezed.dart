// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'get_story_detail_result_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$GetStoryDetailResultState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GetStoryDetailResultState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'GetStoryDetailResultState()';
}


}

/// @nodoc
class $GetStoryDetailResultStateCopyWith<$Res>  {
$GetStoryDetailResultStateCopyWith(GetStoryDetailResultState _, $Res Function(GetStoryDetailResultState) __);
}


/// Adds pattern-matching-related methods to [GetStoryDetailResultState].
extension GetStoryDetailResultStatePatterns on GetStoryDetailResultState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( GetStoryDetailResultStateNone value)?  none,TResult Function( GetStoryDetailResultStateLoading value)?  loading,TResult Function( GetStoryDetailResultStateLoaded value)?  loaded,TResult Function( GetStoryDetailResultStateError value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case GetStoryDetailResultStateNone() when none != null:
return none(_that);case GetStoryDetailResultStateLoading() when loading != null:
return loading(_that);case GetStoryDetailResultStateLoaded() when loaded != null:
return loaded(_that);case GetStoryDetailResultStateError() when error != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( GetStoryDetailResultStateNone value)  none,required TResult Function( GetStoryDetailResultStateLoading value)  loading,required TResult Function( GetStoryDetailResultStateLoaded value)  loaded,required TResult Function( GetStoryDetailResultStateError value)  error,}){
final _that = this;
switch (_that) {
case GetStoryDetailResultStateNone():
return none(_that);case GetStoryDetailResultStateLoading():
return loading(_that);case GetStoryDetailResultStateLoaded():
return loaded(_that);case GetStoryDetailResultStateError():
return error(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( GetStoryDetailResultStateNone value)?  none,TResult? Function( GetStoryDetailResultStateLoading value)?  loading,TResult? Function( GetStoryDetailResultStateLoaded value)?  loaded,TResult? Function( GetStoryDetailResultStateError value)?  error,}){
final _that = this;
switch (_that) {
case GetStoryDetailResultStateNone() when none != null:
return none(_that);case GetStoryDetailResultStateLoading() when loading != null:
return loading(_that);case GetStoryDetailResultStateLoaded() when loaded != null:
return loaded(_that);case GetStoryDetailResultStateError() when error != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  none,TResult Function()?  loading,TResult Function( String message,  Story story)?  loaded,TResult Function( String message)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case GetStoryDetailResultStateNone() when none != null:
return none();case GetStoryDetailResultStateLoading() when loading != null:
return loading();case GetStoryDetailResultStateLoaded() when loaded != null:
return loaded(_that.message,_that.story);case GetStoryDetailResultStateError() when error != null:
return error(_that.message);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  none,required TResult Function()  loading,required TResult Function( String message,  Story story)  loaded,required TResult Function( String message)  error,}) {final _that = this;
switch (_that) {
case GetStoryDetailResultStateNone():
return none();case GetStoryDetailResultStateLoading():
return loading();case GetStoryDetailResultStateLoaded():
return loaded(_that.message,_that.story);case GetStoryDetailResultStateError():
return error(_that.message);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  none,TResult? Function()?  loading,TResult? Function( String message,  Story story)?  loaded,TResult? Function( String message)?  error,}) {final _that = this;
switch (_that) {
case GetStoryDetailResultStateNone() when none != null:
return none();case GetStoryDetailResultStateLoading() when loading != null:
return loading();case GetStoryDetailResultStateLoaded() when loaded != null:
return loaded(_that.message,_that.story);case GetStoryDetailResultStateError() when error != null:
return error(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class GetStoryDetailResultStateNone implements GetStoryDetailResultState {
  const GetStoryDetailResultStateNone();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GetStoryDetailResultStateNone);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'GetStoryDetailResultState.none()';
}


}




/// @nodoc


class GetStoryDetailResultStateLoading implements GetStoryDetailResultState {
  const GetStoryDetailResultStateLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GetStoryDetailResultStateLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'GetStoryDetailResultState.loading()';
}


}




/// @nodoc


class GetStoryDetailResultStateLoaded implements GetStoryDetailResultState {
  const GetStoryDetailResultStateLoaded({required this.message, required this.story});
  

 final  String message;
 final  Story story;

/// Create a copy of GetStoryDetailResultState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GetStoryDetailResultStateLoadedCopyWith<GetStoryDetailResultStateLoaded> get copyWith => _$GetStoryDetailResultStateLoadedCopyWithImpl<GetStoryDetailResultStateLoaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GetStoryDetailResultStateLoaded&&(identical(other.message, message) || other.message == message)&&(identical(other.story, story) || other.story == story));
}


@override
int get hashCode => Object.hash(runtimeType,message,story);

@override
String toString() {
  return 'GetStoryDetailResultState.loaded(message: $message, story: $story)';
}


}

/// @nodoc
abstract mixin class $GetStoryDetailResultStateLoadedCopyWith<$Res> implements $GetStoryDetailResultStateCopyWith<$Res> {
  factory $GetStoryDetailResultStateLoadedCopyWith(GetStoryDetailResultStateLoaded value, $Res Function(GetStoryDetailResultStateLoaded) _then) = _$GetStoryDetailResultStateLoadedCopyWithImpl;
@useResult
$Res call({
 String message, Story story
});


$StoryCopyWith<$Res> get story;

}
/// @nodoc
class _$GetStoryDetailResultStateLoadedCopyWithImpl<$Res>
    implements $GetStoryDetailResultStateLoadedCopyWith<$Res> {
  _$GetStoryDetailResultStateLoadedCopyWithImpl(this._self, this._then);

  final GetStoryDetailResultStateLoaded _self;
  final $Res Function(GetStoryDetailResultStateLoaded) _then;

/// Create a copy of GetStoryDetailResultState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,Object? story = null,}) {
  return _then(GetStoryDetailResultStateLoaded(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,story: null == story ? _self.story : story // ignore: cast_nullable_to_non_nullable
as Story,
  ));
}

/// Create a copy of GetStoryDetailResultState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$StoryCopyWith<$Res> get story {
  
  return $StoryCopyWith<$Res>(_self.story, (value) {
    return _then(_self.copyWith(story: value));
  });
}
}

/// @nodoc


class GetStoryDetailResultStateError implements GetStoryDetailResultState {
  const GetStoryDetailResultStateError(this.message);
  

 final  String message;

/// Create a copy of GetStoryDetailResultState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GetStoryDetailResultStateErrorCopyWith<GetStoryDetailResultStateError> get copyWith => _$GetStoryDetailResultStateErrorCopyWithImpl<GetStoryDetailResultStateError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GetStoryDetailResultStateError&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'GetStoryDetailResultState.error(message: $message)';
}


}

/// @nodoc
abstract mixin class $GetStoryDetailResultStateErrorCopyWith<$Res> implements $GetStoryDetailResultStateCopyWith<$Res> {
  factory $GetStoryDetailResultStateErrorCopyWith(GetStoryDetailResultStateError value, $Res Function(GetStoryDetailResultStateError) _then) = _$GetStoryDetailResultStateErrorCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$GetStoryDetailResultStateErrorCopyWithImpl<$Res>
    implements $GetStoryDetailResultStateErrorCopyWith<$Res> {
  _$GetStoryDetailResultStateErrorCopyWithImpl(this._self, this._then);

  final GetStoryDetailResultStateError _self;
  final $Res Function(GetStoryDetailResultStateError) _then;

/// Create a copy of GetStoryDetailResultState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(GetStoryDetailResultStateError(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
