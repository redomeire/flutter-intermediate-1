import 'package:freezed_annotation/freezed_annotation.dart';

part 'register_result.freezed.dart';
part 'register_result.g.dart';

@freezed
abstract class RegisterResult with _$RegisterResult {
  const factory RegisterResult({required bool error, required String message}) =
      _RegisterResult;

  factory RegisterResult.fromJson(Map<String, dynamic> json) =>
      _$RegisterResultFromJson(json);
}
