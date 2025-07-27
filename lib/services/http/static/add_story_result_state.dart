sealed class AddStoryResultState {}

class AddStoryResultNone extends AddStoryResultState {}

class AddStoryResultLoading extends AddStoryResultState {}

class AddStoryResultSuccess extends AddStoryResultState {
  String message;
  AddStoryResultSuccess({required this.message});
}

class AddStoryResultFailed extends AddStoryResultState {
  String message;
  AddStoryResultFailed({required this.message});
}
