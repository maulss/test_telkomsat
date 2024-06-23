import 'package:flutter/material.dart';
import 'package:test_telkomsat2/models/response_user_model.dart';
import 'package:test_telkomsat2/services/user_service.dart';

class UserProvider extends ChangeNotifier {
  ResponseUserModel? _userData;
  ResponseUserModel? get userData => _userData;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  String? _error;
  String? get error => _error;

  UserService userService = UserService();

  void getCurrentUser() async {
    _isLoading = true;
    notifyListeners();
    try {
      final response = await userService.getCurrentUser();
      if (response != null) {
        _userData = response;
        print(_userData?.firstName);
      } else {
        _error = "Data Kosong";
      }
    } catch (e) {
      _error = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
