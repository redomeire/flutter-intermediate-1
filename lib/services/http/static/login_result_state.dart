import 'package:belajar_aplikasi_flutter_intermediate/models/user.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_result_state.freezed.dart';
@freezed
sealed class LoginResultState with _$LoginResultState {
  const factory LoginResultState.none() = LoginResultStateNone;
  const factory LoginResultState.loading() = LoginResultStateLoading;
  const factory LoginResultState.loaded({required String message, required User user}) = LoginResultStateLoaded;
  const factory LoginResultState.error(String message) = LoginResultStateError;
}
