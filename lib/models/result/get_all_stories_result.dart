import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:belajar_aplikasi_flutter_intermediate/models/story.dart';

part 'get_all_stories_result.freezed.dart';
part 'get_all_stories_result.g.dart';

@freezed
abstract class GetAllStoriesResult with _$GetAllStoriesResult {
  const factory GetAllStoriesResult({
    required bool error,
    required String message,
    required List<Story> listStory,
  }) = _GetAllStoriesResult;

  factory GetAllStoriesResult.fromJson(Map<String, dynamic> json) => _$GetAllStoriesResultFromJson(json);
}
