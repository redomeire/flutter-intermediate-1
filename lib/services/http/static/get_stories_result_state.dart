import 'package:belajar_aplikasi_flutter_intermediate/models/story.dart';

sealed class GetStoriesResultState {}

class GetStoriesResultNone extends GetStoriesResultState {}

class GetStoriesResultLoading extends GetStoriesResultState {}

class GetStoriesResultSuccess extends GetStoriesResultState {
  String message;
  List<Story> listStory;
  GetStoriesResultSuccess({required this.message, required this.listStory});
}

class GetStoriesResultError extends GetStoriesResultState {
  String message;
  GetStoriesResultError({required this.message});
}
