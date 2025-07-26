sealed class RegisterResultState {}

class RegisterResultNone extends RegisterResultState {}

class RegisterResultLoading extends RegisterResultState {}

class RegisterResultSuccess extends RegisterResultState {
  final String message;

  RegisterResultSuccess(this.message);
}

class RegisterResultFailed extends RegisterResultState {
  final String message;

  RegisterResultFailed(this.message);
}
