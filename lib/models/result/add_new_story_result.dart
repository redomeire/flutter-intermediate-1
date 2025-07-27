import 'dart:convert';

class AddNewStoryResult {
  bool error;
  String message;

  AddNewStoryResult({required this.error, required this.message});

  factory AddNewStoryResult.fromMap(Map<String, dynamic> map) {
    return AddNewStoryResult(
      error: map['error'] ?? false,
      message: map['message'] ?? '',
    );
  }

  factory AddNewStoryResult.fromJson(String source) =>
      AddNewStoryResult.fromMap(json.decode(source));
}
