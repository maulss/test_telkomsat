import 'package:flutter/material.dart';
import 'package:test_telkomsat2/models/response_login_model.dart';
import 'package:test_telkomsat2/services/login_service.dart';
import 'package:test_telkomsat2/utils/shared_pref.dart';

class LoginProvider extends ChangeNotifier {
  ResponseLoginModel? _loginData;
  ResponseLoginModel? get loginData => _loginData;
  bool _isLoading = false;
  bool get isLoading => _isLoading;
  bool _isError = false;
  bool get isError => _isError;
  LoginService loginService = LoginService();
  String? _nameError;
  String? get nameError => _nameError;
  String? _passwordError;
  String? get passwordError => _passwordError;
  bool _isObsecure = true;
  bool get isObsecure => _isObsecure;

  void obsecure() {
    _isObsecure = !_isObsecure;
    notifyListeners();
  }

  void validateName(String value) {
    if (value.isEmpty) {
      _nameError = 'Name cannot be empty';
      notifyListeners();
    } else if (value.length < 3) {
      _nameError = 'Name must be at least 3 characters';
      notifyListeners();
    } else {
      _nameError = null;
      notifyListeners();
    }
  }

  void validatePassword(String value) {
    if (value.isEmpty) {
      _passwordError = 'Password cannot be empty';
      notifyListeners();
    } else if (value.length < 3) {
      _passwordError = 'Password must be at least 3 characters';
      notifyListeners();
    } else {
      _passwordError = null;
      notifyListeners();
    }
  }

  Future<void> login(
      String userName, String password, BuildContext context) async {
    _isLoading = true;
    _isError = false;
    notifyListeners();
    try {
      final response = await loginService.login(userName, password);
      if (response != null) {
        _loginData = response;
        SharedPref.saveToken(response.token ?? "");
      } else {
        _isError = true;
        print("Error gagal login");
      }
    } catch (e) {
      _isError = true;
      print(e.toString());
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
