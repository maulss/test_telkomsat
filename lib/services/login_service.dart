import 'package:dio/dio.dart';
import 'package:test_telkomsat2/constants/api_constant.dart';
import 'package:test_telkomsat2/models/response_login_model.dart';

class LoginService {
  final Dio _dio = Dio();

  Future<ResponseLoginModel?> login(String userName, String password) async {
    try {
      final response = await _dio.post(
        "${ApiConstant.baseUrl}/auth/login",
        options: Options(
          headers: {
            "Content-Type": "application/json",
          },
        ),
        data: {
          "username": userName,
          "password": password,
          "expiresInMins": 10000,
        },
      );

      if (response.statusCode == 200) {
        return ResponseLoginModel.fromJson(response.data);
      } else {
        print("Failed to login: ${response.statusMessage}");
        return null;
      }
    } on DioException catch (e) {
      print("Error occurred: $e");
      return null;
    }
  }
}
