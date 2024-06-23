import 'package:dio/dio.dart';
import 'package:test_telkomsat2/constants/api_constant.dart';
import 'package:test_telkomsat2/models/response_user_model.dart';
import 'package:test_telkomsat2/utils/shared_pref.dart';

class UserService {
  final Dio _dio = Dio();

  Future<ResponseUserModel?> getCurrentUser() async {
    String? token = await SharedPref.getToken();
    try {
      final response = await _dio.get(
        "${ApiConstant.baseUrl}/auth/me",
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
          },
        ),
      );
      if (response.statusCode == 200) {
        return ResponseUserModel.fromJson(response.data);
      } else {
        print("Failed to get user: ${response.statusMessage}");
        return null;
      }
    } on DioException catch (e) {
      print("Error occurred: $e");
      return null;
    }
  }
}
