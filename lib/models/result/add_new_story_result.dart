import 'package:freezed_annotation/freezed_annotation.dart';

part 'add_new_story_result.freezed.dart';
part 'add_new_story_result.g.dart';

@freezed
abstract class AddNewStoryResult with _$AddNewStoryResult {
  const factory AddNewStoryResult({
    required bool error,
    required String message,
  }) = _AddNewStoryResult;

  factory AddNewStoryResult.fromJson(Map<String, dynamic> source) => _$AddNewStoryResultFromJson(source);
}
