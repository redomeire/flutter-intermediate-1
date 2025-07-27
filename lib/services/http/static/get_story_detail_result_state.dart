import 'package:belajar_aplikasi_flutter_intermediate/models/story.dart';

sealed class GetStoryDetailResultState {}

class GetStoryDetailResultNone extends GetStoryDetailResultState {}

class GetStoryDetailResultLoading extends GetStoryDetailResultState {}

class GetStoryDetailResultSuccess extends GetStoryDetailResultState {
  String message;
  Story story;
  GetStoryDetailResultSuccess({required this.message, required this.story});
}

class GetStoryDetailResultError extends GetStoryDetailResultState {
  String message;
  GetStoryDetailResultError({required this.message});
}
