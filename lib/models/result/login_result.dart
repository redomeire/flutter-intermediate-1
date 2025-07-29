import 'package:belajar_aplikasi_flutter_intermediate/models/user.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_result.freezed.dart';
part 'login_result.g.dart';

@freezed
abstract class LoginResult with _$LoginResult {
  const factory LoginResult(
      {required bool error, required String message, required User loginResult}) = _LoginResult;

  factory LoginResult.fromJson(Map<String, dynamic> json) => _$LoginResultFromJson(json);
}
