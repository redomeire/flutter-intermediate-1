import 'package:belajar_aplikasi_flutter_intermediate/models/story.dart';

class GetAllStoriesResult {
  bool error;
  String message;
  List<Story> listStory;

  GetAllStoriesResult({
    required this.error,
    required this.message,
    required this.listStory,
  });

  factory GetAllStoriesResult.fromJson(Map<String, dynamic> json) =>
      GetAllStoriesResult(
        error: json["error"],
        message: json["message"],
        listStory: List<Story>.from(
          json["listStory"].map((x) => Story.fromJson(x)),
        ),
      );

  Map<String, dynamic> toJson() => {
    "error": error,
    "message": message,
    "listStory": List<dynamic>.from(listStory.map((x) => x.toJson())),
  };
}
