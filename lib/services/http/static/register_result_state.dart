
import 'package:freezed_annotation/freezed_annotation.dart';

part 'register_result_state.freezed.dart';
@freezed
sealed class RegisterResultState with _$RegisterResultState {
  const factory RegisterResultState.none() = RegisterResultStateNone;
  const factory RegisterResultState.loading() = RegisterResultStateLoading;
  const factory RegisterResultState.loaded(String message) = RegisterResultStateLoaded;
  const factory RegisterResultState.error(String message) = RegisterResultStateError;
}
