import 'package:belajar_aplikasi_flutter_intermediate/models/user.dart';
import 'package:belajar_aplikasi_flutter_intermediate/services/http/api_service.dart';
import 'package:belajar_aplikasi_flutter_intermediate/services/http/static/login_result_state.dart';
import 'package:flutter/widgets.dart';

class LoginProvider extends ChangeNotifier {
  final ApiService apiService;

  LoginProvider({required this.apiService});

  LoginResultState _loginResultState = LoginResultNone();

  LoginResultState get loginResultState => _loginResultState;

  User? _user;

  User? get user => _user;

  String _message = "";

  String get message => _message;

  void initResultState() async {
    _loginResultState = LoginResultNone();
  }

  Future<void> login({required String email, required String password}) async {
    try {
      _loginResultState = LoginResultLoading();
      notifyListeners();
      final result = await apiService.login(email: email, password: password);
      if (!result.error) {
        _loginResultState = LoginResultSuccess(result.message, result.user);
        _user = result.user;
        _message = "Login Successful";
      } else {
        _loginResultState = LoginResultFailed(result.message);
        _message = result.message;
      }
    } catch (e) {
      _loginResultState = LoginResultFailed("Failed to login");
      _message = e.toString();
    } finally {
      notifyListeners();
    }
  }
}
