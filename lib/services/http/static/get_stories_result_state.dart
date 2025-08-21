import 'package:belajar_aplikasi_flutter_intermediate/models/story.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'get_stories_result_state.freezed.dart';
@freezed
sealed class GetStoriesResultState with _$GetStoriesResultState {
  const factory GetStoriesResultState.none() = GetStoriesResultStateNone;
  const factory GetStoriesResultState.loading() = GetStoriesResultStateLoading;
  const factory GetStoriesResultState.loaded({required String message, required List<Story> listStory}) = GetStoriesResultStateLoaded;
  const factory GetStoriesResultState.error(String message) = GetStoriesResultStateError;
}
