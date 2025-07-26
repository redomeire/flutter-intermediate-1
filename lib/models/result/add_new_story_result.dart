class AddNewStoryResult {
  bool error;
  String message;

  AddNewStoryResult({required this.error, required this.message});

  factory AddNewStoryResult.fromJson(Map<String, dynamic> json) =>
      AddNewStoryResult(error: json["error"], message: json["message"]);

  Map<String, dynamic> toJson() => {"error": error, "message": message};
}
