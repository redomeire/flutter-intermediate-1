import 'package:belajar_aplikasi_flutter_intermediate/models/story.dart';
import 'package:belajar_aplikasi_flutter_intermediate/services/http/api_service.dart';
import 'package:belajar_aplikasi_flutter_intermediate/services/http/static/get_story_detail_result_state.dart';
import 'package:flutter/material.dart';

class GetStoryDetailProvider extends ChangeNotifier {
  final ApiService apiService;

  GetStoryDetailProvider({required this.apiService});

  GetStoryDetailResultState _responseState = GetStoryDetailResultNone();

  GetStoryDetailResultState get responseState => _responseState;

  String _message = "";

  String get message => _message;

  bool _error = false;

  bool get error => _error;

  Story? _story;

  Story? get story => _story;

  Future<void> getStoryDetail(String id, String token) async {
    _responseState = GetStoryDetailResultNone();
    _message = "";
    _error = false;
    notifyListeners();
    try {
      _responseState = GetStoryDetailResultLoading();
      notifyListeners();
      final result = await apiService.getStoryDetail(id, token);
      if (result.error == false) {
        _responseState = GetStoryDetailResultSuccess(
          message: message,
          story: result.story,
        );
        _error = false;
        _message = result.message;
        _story = result.story;
        print(
          "Latitude : ${result.story.lat}, Longitude : ${result.story.lon}",
        );
      } else {
        _responseState = GetStoryDetailResultError(message: result.message);
        _error = true;
        _message = result.message;
      }
      notifyListeners();
    } catch (e) {
      final message = "Cannot get story detail";
      _responseState = GetStoryDetailResultError(message: message);
      _error = true;
      _message = message;
      notifyListeners();
    }
  }
}
