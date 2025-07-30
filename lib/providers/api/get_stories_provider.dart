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

  // pagination

  int? pageItems = 1;
  int sizeItems = 10;

  Future<void> getStories({int? location, required String token}) async {
    _error = false;
    _message = "";
    try {
      if (pageItems == 1) {
        _responseState = const GetStoriesResultState.loading();
        notifyListeners();
      }
      final result = await apiService.getAllStories(
        page: pageItems,
        size: sizeItems,
        location: location,
        token: token,
      );

      _listStory.addAll(result.listStory);

      if (result.listStory.length < sizeItems) {
        pageItems = null;
      } else {
        pageItems = pageItems! + 1;
      }

      if (result.error == false) {
        _responseState = GetStoriesResultState.loaded(
          message: result.message,
          listStory: _listStory,
        );
        _error = false;
        _message = result.message;
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
    } finally {
      notifyListeners();
    }
  }

  Future<void> refresh({required String token}) async {
    _listStory.clear();
    pageItems = 1;
    notifyListeners();
    
    await getStories(token: token);
  }
}
