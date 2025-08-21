import 'package:freezed_annotation/freezed_annotation.dart';

part 'add_story_result_state.freezed.dart';
@freezed
sealed class AddStoryResultState with _$AddStoryResultState {
  const factory AddStoryResultState.none() = AddStoryResultStateNone;
  const factory AddStoryResultState.loading() = AddStoryResultStateLoading;
  const factory AddStoryResultState.loaded(String message) = AddStoryResultStateLoaded;
  const factory AddStoryResultState.error(String message) = AddStoryResultStateError;
}