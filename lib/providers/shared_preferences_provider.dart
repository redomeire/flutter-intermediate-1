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
}
