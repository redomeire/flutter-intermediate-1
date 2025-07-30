import 'package:belajar_aplikasi_flutter_intermediate/services/local/shared_preferences_service.dart';
import 'package:flutter/material.dart';

import '../models/user.dart';

class SharedPreferencesProvider extends ChangeNotifier {
  final SharedPreferencesService sharedPreferencesService;

  SharedPreferencesProvider({required this.sharedPreferencesService});

  User? _user;

  User? get user => _user;

  String _message = '';

  String get message => _message;

  String _theme = 'light';

  String get theme => _theme;

  Future<void> setUserData(User user) async {
    try {
      await sharedPreferencesService.setUser(user);
      _user = user;
      _message = "success save user data";
    } catch (e) {
      _message = "failed to save user data";
    } finally {
      notifyListeners();
    }
  }

  Future<void> getUserData() async {
    try {
      final result = await sharedPreferencesService.getUser();
      _user = result;
      _message = "success get user";
    } catch (e) {
      _message = "failed to get user";
    } finally {
      notifyListeners();
    }
  }

  Future<void> deleteUserData() async {
    try {
      await sharedPreferencesService.deleteUser();
      _user = null;
      _message = "success delete user data";
    } catch (e) {
      _message = "error delete user data";
    } finally {
      notifyListeners();
    }
  }

  Future<void> setTheme(String theme) async {
    try {
      await sharedPreferencesService.setTheme(theme);
      _theme = theme;
      _message = "success save theme data";
    } catch (e) {
      _message = "failed to save theme data";
    } finally {
      notifyListeners();
    }
  }

  Future<void> getTheme() async {
    try {
      final theme = await sharedPreferencesService.getTheme();
      _theme = theme ?? "";
      _message = "success get theme";
    } catch (e) {
      _message = "error getting theme";
    } finally {
      notifyListeners();
    }
  }
}
