class RegisterResult {
  bool error;
  String message;

  RegisterResult({required this.error, required this.message});

  factory RegisterResult.fromJson(Map<String, dynamic> json) =>
      RegisterResult(error: json["error"], message: json["message"]);

  Map<String, dynamic> toJson() => {"error": error, "message": message};
}
