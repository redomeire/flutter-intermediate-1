import 'package:freezed_annotation/freezed_annotation.dart';

import '../story.dart';

part 'detail_story_result.freezed.dart';
part 'detail_story_result.g.dart';
@freezed
abstract class DetailStoryResult with _$DetailStoryResult {
  const factory DetailStoryResult({
    required bool error,
    required String message,
    required Story story,
  }) = _DetailStoryResult;

  factory DetailStoryResult.fromJson(Map<String, dynamic> json) => _$DetailStoryResultFromJson(json);
}
