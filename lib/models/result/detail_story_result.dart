import 'package:belajar_aplikasi_flutter_intermediate/models/story.dart';

class DetailStoryResult {
  bool error;
  String message;
  Story story;

  DetailStoryResult({
    required this.error,
    required this.message,
    required this.story,
  });

  factory DetailStoryResult.fromJson(Map<String, dynamic> json) =>
      DetailStoryResult(
        error: json["error"],
        message: json["message"],
        story: Story.fromJson(json["story"]),
      );

  Map<String, dynamic> toJson() => {
    "error": error,
    "message": message,
    "story": story.toJson(),
  };
}
