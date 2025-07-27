import 'package:belajar_aplikasi_flutter_intermediate/services/http/api_service.dart';
import 'package:belajar_aplikasi_flutter_intermediate/services/http/static/register_result_state.dart';
import 'package:flutter/widgets.dart';

class RegisterProvider extends ChangeNotifier {
  final ApiService apiService;

  RegisterProvider({required this.apiService});

  RegisterResultState _registerResultState = RegisterResultNone();

  RegisterResultState get registerResultState => _registerResultState;

  String _message = "";

  String get message => _message;

  bool _error = false;

  bool get error => _error;

  String name = "";

  String email = "";

  String password = "";

  bool isObscureText = true;

  Future<void> register({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      _registerResultState = RegisterResultLoading();
      _message = "";
      _error = false;
      notifyListeners();
      final result = await apiService.register(
        name: name,
        email: email,
        password: password,
      );
      if (!result.error) {
        _registerResultState = RegisterResultSuccess(result.message);
        _message = "Register Successful";
        _error = false;
      } else {
        _registerResultState = RegisterResultFailed(result.message);
        _message = "Register Failed";
        _error = true;
      }
      notifyListeners();
    } catch (e) {
      _registerResultState = RegisterResultFailed("Failed to register");
      _error = true;
      _message = "Register Failed";
      notifyListeners();
    }
  }
}
