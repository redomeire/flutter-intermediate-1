import 'package:belajar_aplikasi_flutter_intermediate/models/story.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'get_story_detail_result_state.freezed.dart';
@freezed
sealed class GetStoryDetailResultState with _$GetStoryDetailResultState {
  const factory GetStoryDetailResultState.none() = GetStoryDetailResultStateNone;
  const factory GetStoryDetailResultState.loading() = GetStoryDetailResultStateLoading;
  const factory GetStoryDetailResultState.loaded({required String message, required Story story}) = GetStoryDetailResultStateLoaded;
  const factory GetStoryDetailResultState.error(String message) = GetStoryDetailResultStateError;
}
