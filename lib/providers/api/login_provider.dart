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

  bool _error = false;

  bool get error => _error;

  String email = "";

  String password = "";

  bool _isObscureText = true;

  bool get isObscureText => _isObscureText;

  void toggleObscureText() {
    _isObscureText = !_isObscureText;
    notifyListeners();
  }

  Future<void> login({required String email, required String password}) async {
    _loginResultState = LoginResultNone();
    notifyListeners();
    try {
      _loginResultState = LoginResultLoading();
      _message = "";
      _error = false;
      notifyListeners();
      final result = await apiService.login(email: email, password: password);
      if (!result.error) {
        _loginResultState = LoginResultSuccess(result.message, result.user);
        _user = result.user;
        _error = false;
        _message = "Login Successful";
      } else {
        _loginResultState = LoginResultFailed(result.message);
        _error = true;
        _message = result.message;
      }
      notifyListeners();
    } catch (e) {
      _loginResultState = LoginResultFailed("Failed to login");
      _error = true;
      _message = e.toString();
      notifyListeners();
    }
  }
}
