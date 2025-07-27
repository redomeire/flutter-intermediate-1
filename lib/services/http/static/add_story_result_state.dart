sealed class AddStoryResultState{}

class AddStoryResultNone extends AddStoryResultState {}

class AddStoryResultLoading extends AddStoryResultState {}

class AddStoryResultSuccess extends AddStoryResultState {
  String message;
  AddStoryResultSuccess({ required this.message });
}

class AddStoryResultError extends AddStoryResultState {
  String message;
  AddStoryResultError({ required this.message });
}