// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'add_story_result_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AddStoryResultState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AddStoryResultState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AddStoryResultState()';
}


}

/// @nodoc
class $AddStoryResultStateCopyWith<$Res>  {
$AddStoryResultStateCopyWith(AddStoryResultState _, $Res Function(AddStoryResultState) __);
}


/// Adds pattern-matching-related methods to [AddStoryResultState].
extension AddStoryResultStatePatterns on AddStoryResultState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( AddStoryResultStateNone value)?  none,TResult Function( AddStoryResultStateLoading value)?  loading,TResult Function( AddStoryResultStateLoaded value)?  loaded,TResult Function( AddStoryResultStateError value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case AddStoryResultStateNone() when none != null:
return none(_that);case AddStoryResultStateLoading() when loading != null:
return loading(_that);case AddStoryResultStateLoaded() when loaded != null:
return loaded(_that);case AddStoryResultStateError() when error != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( AddStoryResultStateNone value)  none,required TResult Function( AddStoryResultStateLoading value)  loading,required TResult Function( AddStoryResultStateLoaded value)  loaded,required TResult Function( AddStoryResultStateError value)  error,}){
final _that = this;
switch (_that) {
case AddStoryResultStateNone():
return none(_that);case AddStoryResultStateLoading():
return loading(_that);case AddStoryResultStateLoaded():
return loaded(_that);case AddStoryResultStateError():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( AddStoryResultStateNone value)?  none,TResult? Function( AddStoryResultStateLoading value)?  loading,TResult? Function( AddStoryResultStateLoaded value)?  loaded,TResult? Function( AddStoryResultStateError value)?  error,}){
final _that = this;
switch (_that) {
case AddStoryResultStateNone() when none != null:
return none(_that);case AddStoryResultStateLoading() when loading != null:
return loading(_that);case AddStoryResultStateLoaded() when loaded != null:
return loaded(_that);case AddStoryResultStateError() when error != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  none,TResult Function()?  loading,TResult Function( String message)?  loaded,TResult Function( String message)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case AddStoryResultStateNone() when none != null:
return none();case AddStoryResultStateLoading() when loading != null:
return loading();case AddStoryResultStateLoaded() when loaded != null:
return loaded(_that.message);case AddStoryResultStateError() when error != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  none,required TResult Function()  loading,required TResult Function( String message)  loaded,required TResult Function( String message)  error,}) {final _that = this;
switch (_that) {
case AddStoryResultStateNone():
return none();case AddStoryResultStateLoading():
return loading();case AddStoryResultStateLoaded():
return loaded(_that.message);case AddStoryResultStateError():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  none,TResult? Function()?  loading,TResult? Function( String message)?  loaded,TResult? Function( String message)?  error,}) {final _that = this;
switch (_that) {
case AddStoryResultStateNone() when none != null:
return none();case AddStoryResultStateLoading() when loading != null:
return loading();case AddStoryResultStateLoaded() when loaded != null:
return loaded(_that.message);case AddStoryResultStateError() when error != null:
return error(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class AddStoryResultStateNone implements AddStoryResultState {
  const AddStoryResultStateNone();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AddStoryResultStateNone);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AddStoryResultState.none()';
}


}




/// @nodoc


class AddStoryResultStateLoading implements AddStoryResultState {
  const AddStoryResultStateLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AddStoryResultStateLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AddStoryResultState.loading()';
}


}




/// @nodoc


class AddStoryResultStateLoaded implements AddStoryResultState {
  const AddStoryResultStateLoaded(this.message);
  

 final  String message;

/// Create a copy of AddStoryResultState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AddStoryResultStateLoadedCopyWith<AddStoryResultStateLoaded> get copyWith => _$AddStoryResultStateLoadedCopyWithImpl<AddStoryResultStateLoaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AddStoryResultStateLoaded&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'AddStoryResultState.loaded(message: $message)';
}


}

/// @nodoc
abstract mixin class $AddStoryResultStateLoadedCopyWith<$Res> implements $AddStoryResultStateCopyWith<$Res> {
  factory $AddStoryResultStateLoadedCopyWith(AddStoryResultStateLoaded value, $Res Function(AddStoryResultStateLoaded) _then) = _$AddStoryResultStateLoadedCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$AddStoryResultStateLoadedCopyWithImpl<$Res>
    implements $AddStoryResultStateLoadedCopyWith<$Res> {
  _$AddStoryResultStateLoadedCopyWithImpl(this._self, this._then);

  final AddStoryResultStateLoaded _self;
  final $Res Function(AddStoryResultStateLoaded) _then;

/// Create a copy of AddStoryResultState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(AddStoryResultStateLoaded(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class AddStoryResultStateError implements AddStoryResultState {
  const AddStoryResultStateError(this.message);
  

 final  String message;

/// Create a copy of AddStoryResultState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AddStoryResultStateErrorCopyWith<AddStoryResultStateError> get copyWith => _$AddStoryResultStateErrorCopyWithImpl<AddStoryResultStateError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AddStoryResultStateError&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'AddStoryResultState.error(message: $message)';
}


}

/// @nodoc
abstract mixin class $AddStoryResultStateErrorCopyWith<$Res> implements $AddStoryResultStateCopyWith<$Res> {
  factory $AddStoryResultStateErrorCopyWith(AddStoryResultStateError value, $Res Function(AddStoryResultStateError) _then) = _$AddStoryResultStateErrorCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$AddStoryResultStateErrorCopyWithImpl<$Res>
    implements $AddStoryResultStateErrorCopyWith<$Res> {
  _$AddStoryResultStateErrorCopyWithImpl(this._self, this._then);

  final AddStoryResultStateError _self;
  final $Res Function(AddStoryResultStateError) _then;

/// Create a copy of AddStoryResultState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(AddStoryResultStateError(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
