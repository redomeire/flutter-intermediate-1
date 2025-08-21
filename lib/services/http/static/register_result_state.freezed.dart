// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'register_result_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$RegisterResultState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RegisterResultState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'RegisterResultState()';
}


}

/// @nodoc
class $RegisterResultStateCopyWith<$Res>  {
$RegisterResultStateCopyWith(RegisterResultState _, $Res Function(RegisterResultState) __);
}


/// Adds pattern-matching-related methods to [RegisterResultState].
extension RegisterResultStatePatterns on RegisterResultState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( RegisterResultStateNone value)?  none,TResult Function( RegisterResultStateLoading value)?  loading,TResult Function( RegisterResultStateLoaded value)?  loaded,TResult Function( RegisterResultStateError value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case RegisterResultStateNone() when none != null:
return none(_that);case RegisterResultStateLoading() when loading != null:
return loading(_that);case RegisterResultStateLoaded() when loaded != null:
return loaded(_that);case RegisterResultStateError() when error != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( RegisterResultStateNone value)  none,required TResult Function( RegisterResultStateLoading value)  loading,required TResult Function( RegisterResultStateLoaded value)  loaded,required TResult Function( RegisterResultStateError value)  error,}){
final _that = this;
switch (_that) {
case RegisterResultStateNone():
return none(_that);case RegisterResultStateLoading():
return loading(_that);case RegisterResultStateLoaded():
return loaded(_that);case RegisterResultStateError():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( RegisterResultStateNone value)?  none,TResult? Function( RegisterResultStateLoading value)?  loading,TResult? Function( RegisterResultStateLoaded value)?  loaded,TResult? Function( RegisterResultStateError value)?  error,}){
final _that = this;
switch (_that) {
case RegisterResultStateNone() when none != null:
return none(_that);case RegisterResultStateLoading() when loading != null:
return loading(_that);case RegisterResultStateLoaded() when loaded != null:
return loaded(_that);case RegisterResultStateError() when error != null:
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
case RegisterResultStateNone() when none != null:
return none();case RegisterResultStateLoading() when loading != null:
return loading();case RegisterResultStateLoaded() when loaded != null:
return loaded(_that.message);case RegisterResultStateError() when error != null:
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
case RegisterResultStateNone():
return none();case RegisterResultStateLoading():
return loading();case RegisterResultStateLoaded():
return loaded(_that.message);case RegisterResultStateError():
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
case RegisterResultStateNone() when none != null:
return none();case RegisterResultStateLoading() when loading != null:
return loading();case RegisterResultStateLoaded() when loaded != null:
return loaded(_that.message);case RegisterResultStateError() when error != null:
return error(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class RegisterResultStateNone implements RegisterResultState {
  const RegisterResultStateNone();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RegisterResultStateNone);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'RegisterResultState.none()';
}


}




/// @nodoc


class RegisterResultStateLoading implements RegisterResultState {
  const RegisterResultStateLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RegisterResultStateLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'RegisterResultState.loading()';
}


}




/// @nodoc


class RegisterResultStateLoaded implements RegisterResultState {
  const RegisterResultStateLoaded(this.message);
  

 final  String message;

/// Create a copy of RegisterResultState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RegisterResultStateLoadedCopyWith<RegisterResultStateLoaded> get copyWith => _$RegisterResultStateLoadedCopyWithImpl<RegisterResultStateLoaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RegisterResultStateLoaded&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'RegisterResultState.loaded(message: $message)';
}


}

/// @nodoc
abstract mixin class $RegisterResultStateLoadedCopyWith<$Res> implements $RegisterResultStateCopyWith<$Res> {
  factory $RegisterResultStateLoadedCopyWith(RegisterResultStateLoaded value, $Res Function(RegisterResultStateLoaded) _then) = _$RegisterResultStateLoadedCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$RegisterResultStateLoadedCopyWithImpl<$Res>
    implements $RegisterResultStateLoadedCopyWith<$Res> {
  _$RegisterResultStateLoadedCopyWithImpl(this._self, this._then);

  final RegisterResultStateLoaded _self;
  final $Res Function(RegisterResultStateLoaded) _then;

/// Create a copy of RegisterResultState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(RegisterResultStateLoaded(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class RegisterResultStateError implements RegisterResultState {
  const RegisterResultStateError(this.message);
  

 final  String message;

/// Create a copy of RegisterResultState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RegisterResultStateErrorCopyWith<RegisterResultStateError> get copyWith => _$RegisterResultStateErrorCopyWithImpl<RegisterResultStateError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RegisterResultStateError&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'RegisterResultState.error(message: $message)';
}


}

/// @nodoc
abstract mixin class $RegisterResultStateErrorCopyWith<$Res> implements $RegisterResultStateCopyWith<$Res> {
  factory $RegisterResultStateErrorCopyWith(RegisterResultStateError value, $Res Function(RegisterResultStateError) _then) = _$RegisterResultStateErrorCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$RegisterResultStateErrorCopyWithImpl<$Res>
    implements $RegisterResultStateErrorCopyWith<$Res> {
  _$RegisterResultStateErrorCopyWithImpl(this._self, this._then);

  final RegisterResultStateError _self;
  final $Res Function(RegisterResultStateError) _then;

/// Create a copy of RegisterResultState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(RegisterResultStateError(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
