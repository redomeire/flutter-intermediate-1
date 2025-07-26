import 'package:belajar_aplikasi_flutter_intermediate/models/user.dart';

sealed class LoginResultState {}

class LoginResultNone extends LoginResultState {}

class LoginResultLoading extends LoginResultState {}

class LoginResultSuccess extends LoginResultState {
  final String message;
  final User user;
  LoginResultSuccess(this.message, this.user);
}

class LoginResultFailed extends LoginResultState {
  final String message;
  LoginResultFailed(this.message);
}
