// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'get_stories_result_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$GetStoriesResultState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GetStoriesResultState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'GetStoriesResultState()';
}


}

/// @nodoc
class $GetStoriesResultStateCopyWith<$Res>  {
$GetStoriesResultStateCopyWith(GetStoriesResultState _, $Res Function(GetStoriesResultState) __);
}


/// Adds pattern-matching-related methods to [GetStoriesResultState].
extension GetStoriesResultStatePatterns on GetStoriesResultState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( GetStoriesResultStateNone value)?  none,TResult Function( GetStoriesResultStateLoading value)?  loading,TResult Function( GetStoriesResultStateLoaded value)?  loaded,TResult Function( GetStoriesResultStateError value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case GetStoriesResultStateNone() when none != null:
return none(_that);case GetStoriesResultStateLoading() when loading != null:
return loading(_that);case GetStoriesResultStateLoaded() when loaded != null:
return loaded(_that);case GetStoriesResultStateError() when error != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( GetStoriesResultStateNone value)  none,required TResult Function( GetStoriesResultStateLoading value)  loading,required TResult Function( GetStoriesResultStateLoaded value)  loaded,required TResult Function( GetStoriesResultStateError value)  error,}){
final _that = this;
switch (_that) {
case GetStoriesResultStateNone():
return none(_that);case GetStoriesResultStateLoading():
return loading(_that);case GetStoriesResultStateLoaded():
return loaded(_that);case GetStoriesResultStateError():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( GetStoriesResultStateNone value)?  none,TResult? Function( GetStoriesResultStateLoading value)?  loading,TResult? Function( GetStoriesResultStateLoaded value)?  loaded,TResult? Function( GetStoriesResultStateError value)?  error,}){
final _that = this;
switch (_that) {
case GetStoriesResultStateNone() when none != null:
return none(_that);case GetStoriesResultStateLoading() when loading != null:
return loading(_that);case GetStoriesResultStateLoaded() when loaded != null:
return loaded(_that);case GetStoriesResultStateError() when error != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  none,TResult Function()?  loading,TResult Function( String message,  List<Story> listStory)?  loaded,TResult Function( String message)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case GetStoriesResultStateNone() when none != null:
return none();case GetStoriesResultStateLoading() when loading != null:
return loading();case GetStoriesResultStateLoaded() when loaded != null:
return loaded(_that.message,_that.listStory);case GetStoriesResultStateError() when error != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  none,required TResult Function()  loading,required TResult Function( String message,  List<Story> listStory)  loaded,required TResult Function( String message)  error,}) {final _that = this;
switch (_that) {
case GetStoriesResultStateNone():
return none();case GetStoriesResultStateLoading():
return loading();case GetStoriesResultStateLoaded():
return loaded(_that.message,_that.listStory);case GetStoriesResultStateError():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  none,TResult? Function()?  loading,TResult? Function( String message,  List<Story> listStory)?  loaded,TResult? Function( String message)?  error,}) {final _that = this;
switch (_that) {
case GetStoriesResultStateNone() when none != null:
return none();case GetStoriesResultStateLoading() when loading != null:
return loading();case GetStoriesResultStateLoaded() when loaded != null:
return loaded(_that.message,_that.listStory);case GetStoriesResultStateError() when error != null:
return error(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class GetStoriesResultStateNone implements GetStoriesResultState {
  const GetStoriesResultStateNone();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GetStoriesResultStateNone);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'GetStoriesResultState.none()';
}


}




/// @nodoc


class GetStoriesResultStateLoading implements GetStoriesResultState {
  const GetStoriesResultStateLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GetStoriesResultStateLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'GetStoriesResultState.loading()';
}


}




/// @nodoc


class GetStoriesResultStateLoaded implements GetStoriesResultState {
  const GetStoriesResultStateLoaded(this.message, final  List<Story> listStory): _listStory = listStory;
  

 final  String message;
 final  List<Story> _listStory;
 List<Story> get listStory {
  if (_listStory is EqualUnmodifiableListView) return _listStory;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_listStory);
}


/// Create a copy of GetStoriesResultState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GetStoriesResultStateLoadedCopyWith<GetStoriesResultStateLoaded> get copyWith => _$GetStoriesResultStateLoadedCopyWithImpl<GetStoriesResultStateLoaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GetStoriesResultStateLoaded&&(identical(other.message, message) || other.message == message)&&const DeepCollectionEquality().equals(other._listStory, _listStory));
}


@override
int get hashCode => Object.hash(runtimeType,message,const DeepCollectionEquality().hash(_listStory));

@override
String toString() {
  return 'GetStoriesResultState.loaded(message: $message, listStory: $listStory)';
}


}

/// @nodoc
abstract mixin class $GetStoriesResultStateLoadedCopyWith<$Res> implements $GetStoriesResultStateCopyWith<$Res> {
  factory $GetStoriesResultStateLoadedCopyWith(GetStoriesResultStateLoaded value, $Res Function(GetStoriesResultStateLoaded) _then) = _$GetStoriesResultStateLoadedCopyWithImpl;
@useResult
$Res call({
 String message, List<Story> listStory
});




}
/// @nodoc
class _$GetStoriesResultStateLoadedCopyWithImpl<$Res>
    implements $GetStoriesResultStateLoadedCopyWith<$Res> {
  _$GetStoriesResultStateLoadedCopyWithImpl(this._self, this._then);

  final GetStoriesResultStateLoaded _self;
  final $Res Function(GetStoriesResultStateLoaded) _then;

/// Create a copy of GetStoriesResultState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,Object? listStory = null,}) {
  return _then(GetStoriesResultStateLoaded(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,null == listStory ? _self._listStory : listStory // ignore: cast_nullable_to_non_nullable
as List<Story>,
  ));
}


}

/// @nodoc


class GetStoriesResultStateError implements GetStoriesResultState {
  const GetStoriesResultStateError(this.message);
  

 final  String message;

/// Create a copy of GetStoriesResultState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GetStoriesResultStateErrorCopyWith<GetStoriesResultStateError> get copyWith => _$GetStoriesResultStateErrorCopyWithImpl<GetStoriesResultStateError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GetStoriesResultStateError&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'GetStoriesResultState.error(message: $message)';
}


}

/// @nodoc
abstract mixin class $GetStoriesResultStateErrorCopyWith<$Res> implements $GetStoriesResultStateCopyWith<$Res> {
  factory $GetStoriesResultStateErrorCopyWith(GetStoriesResultStateError value, $Res Function(GetStoriesResultStateError) _then) = _$GetStoriesResultStateErrorCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$GetStoriesResultStateErrorCopyWithImpl<$Res>
    implements $GetStoriesResultStateErrorCopyWith<$Res> {
  _$GetStoriesResultStateErrorCopyWithImpl(this._self, this._then);

  final GetStoriesResultStateError _self;
  final $Res Function(GetStoriesResultStateError) _then;

/// Create a copy of GetStoriesResultState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(GetStoriesResultStateError(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
