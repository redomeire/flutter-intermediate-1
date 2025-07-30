import 'dart:convert';

import 'package:belajar_aplikasi_flutter_intermediate/models/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesService {
  final SharedPreferences sharedPreferences;

  SharedPreferencesService(this.sharedPreferences);

  Future<void> setUser(User user) async {
    await sharedPreferences.setString("App.User", jsonEncode(user));
  }

  Future<User> getUser() async {
    final user = sharedPreferences.getString("App.User");
    final decodedUser = jsonDecode(user!);
    return User.fromJson(decodedUser);
  }

  Future<void> deleteUser() async {
    await sharedPreferences.remove("App.User");
  }

  Future<void> setTheme(String theme) async {
    await sharedPreferences.setString("App.Theme", theme);
  }

  Future<String?> getTheme() async {
    final theme = sharedPreferences.getString("App.Theme");
    return theme;
  }
}
