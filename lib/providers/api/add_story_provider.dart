import 'dart:io';

import 'package:belajar_aplikasi_flutter_intermediate/services/http/api_service.dart';
import 'package:belajar_aplikasi_flutter_intermediate/services/http/static/add_story_result_state.dart';
import 'package:flutter/cupertino.dart';

class AddStoryProvider extends ChangeNotifier {
  final ApiService apiService;

  AddStoryProvider({required this.apiService});

  AddStoryResultState _responseState = AddStoryResultNone();

  AddStoryResultState get responseState => _responseState;

  String _message = "";

  String get message => _message;

  bool _error = false;

  bool get error => _error;

  Future<void> addStory({
    required String description,
    required File photo,
    required num lat,
    required num lon,
    String? token,
  }) async {
    _responseState = AddStoryResultNone();
    _error = false;
    _message = "";
    notifyListeners();
    try {
      _responseState = AddStoryResultLoading();
      notifyListeners();
      final result = await apiService.addNewStory(
        description: description,
        photo: photo,
        lat: lat,
        lon: lon,
        token: token,
      );
      if (result.error == false) {
        _responseState = AddStoryResultSuccess(message: message);
        _error = false;
        _message = result.message;
      } else {
        _responseState = AddStoryResultError(message: result.message);
        _error = true;
        _message = result.message;
      }
      notifyListeners();
    } catch (e) {
      final message = "Cannot get story detail";
      _responseState = AddStoryResultError(message: message);
      _error = true;
      _message = message;
      notifyListeners();
    }
  }
}
