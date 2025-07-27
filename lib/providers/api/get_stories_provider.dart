import 'package:belajar_aplikasi_flutter_intermediate/services/http/api_service.dart';
import 'package:belajar_aplikasi_flutter_intermediate/services/http/static/get_stories_result_state.dart';
import 'package:flutter/cupertino.dart';

class GetStoriesProvider extends ChangeNotifier {
  final ApiService apiService;

  GetStoriesProvider({required this.apiService});

  GetStoriesResultState _responseState = GetStoriesResultNone();

  GetStoriesResultState get responseState => _responseState;

  String _message = "";

  String get message => _message;

  bool _error = false;

  bool get error => _error;

  Future<void> getStories({
    int? page,
    int? size,
    int? location,
    required String token,
  }) async {
    _error = false;
    _message = "";
    notifyListeners();
    try {
      _responseState = GetStoriesResultLoading();
      notifyListeners();
      final result = await apiService.getAllStories(
        page: page,
        size: size,
        location: location,
        token: token,
      );
      if (result.error == false) {
        _responseState = GetStoriesResultSuccess(
          message: message,
          listStory: result.listStory,
        );
        _error = false;
        _message = result.message;
      } else {
        _responseState = GetStoriesResultError(message: result.message);
        _error = true;
        _message = result.message;
      }
      notifyListeners();
    } catch (e) {
      final message = "Cannot get stories";
      _responseState = GetStoriesResultError(message: message);
      _error = true;
      _message = message;
      notifyListeners();
    }
  }
}
