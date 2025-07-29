import 'package:belajar_aplikasi_flutter_intermediate/models/story.dart';
import 'package:belajar_aplikasi_flutter_intermediate/services/http/api_service.dart';
import 'package:belajar_aplikasi_flutter_intermediate/services/http/static/get_stories_result_state.dart';
import 'package:flutter/material.dart';

class GetStoriesProvider extends ChangeNotifier {
  final ApiService apiService;

  GetStoriesProvider({required this.apiService});

  GetStoriesResultState _responseState = const GetStoriesResultState.none();

  GetStoriesResultState get responseState => _responseState;

  String _message = "";

  String get message => _message;

  bool _error = false;

  bool get error => _error;

  final List<Story> _listStory = [];

  List<Story> get listStory => _listStory;

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  // pagination

  int? pageItems = 1;
  int sizeItems = 10;

  Future<void> getStories({int? location, required String token}) async {
    if (_isLoading || pageItems == null) return; // prevent duplicate calls

    _responseState = const GetStoriesResultState.none();
    _isLoading = true;
    notifyListeners();

    _error = false;
    _message = "";
    try {
      if (_listStory.isEmpty) {
        _responseState = const GetStoriesResultState.loading();
      }
      notifyListeners();
      final result = await apiService.getAllStories(
        page: pageItems,
        size: sizeItems,
        location: location,
        token: token,
      );
      if (result.error == false) {
        _responseState = GetStoriesResultState.loaded(message, listStory);
        _listStory.addAll(result.listStory);
        _error = false;
        _message = result.message;

        if (result.listStory.length < sizeItems) {
          pageItems = null;
        } else {
          pageItems = pageItems! + 1;
        }
      } else {
        _responseState = GetStoriesResultState.error(message);
        _error = true;
        _message = result.message;
      }
      notifyListeners();
    } catch (e) {
      final message = "Cannot get stories";
      _responseState = GetStoriesResultState.error(message);
      _error = true;
      _message = message;
      notifyListeners();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
