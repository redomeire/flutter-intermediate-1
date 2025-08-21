// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_LoginResult _$LoginResultFromJson(Map<String, dynamic> json) => _LoginResult(
  error: json['error'] as bool,
  message: json['message'] as String,
  loginResult: User.fromJson(json['loginResult'] as Map<String, dynamic>),
);

Map<String, dynamic> _$LoginResultToJson(_LoginResult instance) =>
    <String, dynamic>{
      'error': instance.error,
      'message': instance.message,
      'loginResult': instance.loginResult,
    };
