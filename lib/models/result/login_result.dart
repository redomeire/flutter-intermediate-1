import 'package:belajar_aplikasi_flutter_intermediate/models/user.dart';

class LoginResult {
  bool error;
  String message;
  User user;

  LoginResult({
    required this.error,
    required this.message,
    required this.user,
  });

  factory LoginResult.fromJson(Map<String, dynamic> json) => LoginResult(
    error: json["error"],
    message: json["message"],
    user: User.fromJson(json["loginResult"]),
  );

  Map<String, dynamic> toJson() => {
    "error": error,
    "message": message,
    "loginResult": user.toJson(),
  };
}