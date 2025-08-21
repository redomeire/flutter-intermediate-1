// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'login_result_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$LoginResultState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoginResultState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'LoginResultState()';
}


}

/// @nodoc
class $LoginResultStateCopyWith<$Res>  {
$LoginResultStateCopyWith(LoginResultState _, $Res Function(LoginResultState) __);
}


/// Adds pattern-matching-related methods to [LoginResultState].
extension LoginResultStatePatterns on LoginResultState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( LoginResultStateNone value)?  none,TResult Function( LoginResultStateLoading value)?  loading,TResult Function( LoginResultStateLoaded value)?  loaded,TResult Function( LoginResultStateError value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case LoginResultStateNone() when none != null:
return none(_that);case LoginResultStateLoading() when loading != null:
return loading(_that);case LoginResultStateLoaded() when loaded != null:
return loaded(_that);case LoginResultStateError() when error != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( LoginResultStateNone value)  none,required TResult Function( LoginResultStateLoading value)  loading,required TResult Function( LoginResultStateLoaded value)  loaded,required TResult Function( LoginResultStateError value)  error,}){
final _that = this;
switch (_that) {
case LoginResultStateNone():
return none(_that);case LoginResultStateLoading():
return loading(_that);case LoginResultStateLoaded():
return loaded(_that);case LoginResultStateError():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( LoginResultStateNone value)?  none,TResult? Function( LoginResultStateLoading value)?  loading,TResult? Function( LoginResultStateLoaded value)?  loaded,TResult? Function( LoginResultStateError value)?  error,}){
final _that = this;
switch (_that) {
case LoginResultStateNone() when none != null:
return none(_that);case LoginResultStateLoading() when loading != null:
return loading(_that);case LoginResultStateLoaded() when loaded != null:
return loaded(_that);case LoginResultStateError() when error != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  none,TResult Function()?  loading,TResult Function( String message,  User user)?  loaded,TResult Function( String message)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case LoginResultStateNone() when none != null:
return none();case LoginResultStateLoading() when loading != null:
return loading();case LoginResultStateLoaded() when loaded != null:
return loaded(_that.message,_that.user);case LoginResultStateError() when error != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  none,required TResult Function()  loading,required TResult Function( String message,  User user)  loaded,required TResult Function( String message)  error,}) {final _that = this;
switch (_that) {
case LoginResultStateNone():
return none();case LoginResultStateLoading():
return loading();case LoginResultStateLoaded():
return loaded(_that.message,_that.user);case LoginResultStateError():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  none,TResult? Function()?  loading,TResult? Function( String message,  User user)?  loaded,TResult? Function( String message)?  error,}) {final _that = this;
switch (_that) {
case LoginResultStateNone() when none != null:
return none();case LoginResultStateLoading() when loading != null:
return loading();case LoginResultStateLoaded() when loaded != null:
return loaded(_that.message,_that.user);case LoginResultStateError() when error != null:
return error(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class LoginResultStateNone implements LoginResultState {
  const LoginResultStateNone();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoginResultStateNone);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'LoginResultState.none()';
}


}




/// @nodoc


class LoginResultStateLoading implements LoginResultState {
  const LoginResultStateLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoginResultStateLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'LoginResultState.loading()';
}


}




/// @nodoc


class LoginResultStateLoaded implements LoginResultState {
  const LoginResultStateLoaded({required this.message, required this.user});
  

 final  String message;
 final  User user;

/// Create a copy of LoginResultState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LoginResultStateLoadedCopyWith<LoginResultStateLoaded> get copyWith => _$LoginResultStateLoadedCopyWithImpl<LoginResultStateLoaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoginResultStateLoaded&&(identical(other.message, message) || other.message == message)&&(identical(other.user, user) || other.user == user));
}


@override
int get hashCode => Object.hash(runtimeType,message,user);

@override
String toString() {
  return 'LoginResultState.loaded(message: $message, user: $user)';
}


}

/// @nodoc
abstract mixin class $LoginResultStateLoadedCopyWith<$Res> implements $LoginResultStateCopyWith<$Res> {
  factory $LoginResultStateLoadedCopyWith(LoginResultStateLoaded value, $Res Function(LoginResultStateLoaded) _then) = _$LoginResultStateLoadedCopyWithImpl;
@useResult
$Res call({
 String message, User user
});


$UserCopyWith<$Res> get user;

}
/// @nodoc
class _$LoginResultStateLoadedCopyWithImpl<$Res>
    implements $LoginResultStateLoadedCopyWith<$Res> {
  _$LoginResultStateLoadedCopyWithImpl(this._self, this._then);

  final LoginResultStateLoaded _self;
  final $Res Function(LoginResultStateLoaded) _then;

/// Create a copy of LoginResultState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,Object? user = null,}) {
  return _then(LoginResultStateLoaded(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,user: null == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as User,
  ));
}

/// Create a copy of LoginResultState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserCopyWith<$Res> get user {
  
  return $UserCopyWith<$Res>(_self.user, (value) {
    return _then(_self.copyWith(user: value));
  });
}
}

/// @nodoc


class LoginResultStateError implements LoginResultState {
  const LoginResultStateError(this.message);
  

 final  String message;

/// Create a copy of LoginResultState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LoginResultStateErrorCopyWith<LoginResultStateError> get copyWith => _$LoginResultStateErrorCopyWithImpl<LoginResultStateError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoginResultStateError&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'LoginResultState.error(message: $message)';
}


}

/// @nodoc
abstract mixin class $LoginResultStateErrorCopyWith<$Res> implements $LoginResultStateCopyWith<$Res> {
  factory $LoginResultStateErrorCopyWith(LoginResultStateError value, $Res Function(LoginResultStateError) _then) = _$LoginResultStateErrorCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$LoginResultStateErrorCopyWithImpl<$Res>
    implements $LoginResultStateErrorCopyWith<$Res> {
  _$LoginResultStateErrorCopyWithImpl(this._self, this._then);

  final LoginResultStateError _self;
  final $Res Function(LoginResultStateError) _then;

/// Create a copy of LoginResultState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(LoginResultStateError(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
