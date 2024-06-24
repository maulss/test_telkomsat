import 'package:dio/dio.dart';
import 'package:test_telkomsat2/constants/api_constant.dart';
import 'package:test_telkomsat2/models/response_update_product_model.dart';

class UpdateProductService {
  final Dio _dio = Dio();

  Future<ResponseUpdateproductModel?> updateproduct(int id, String title,
      String category, double price, int stock, String description) async {
    try {
      final response = await _dio.put(
        "${ApiConstant.baseUrl}/products/$id",
        data: {
          "title": title,
          "category": category,
          "price": price,
          "stock": stock,
          "description": description,
        },
        options: Options(
          headers: {
            "Content-Type": "application/json",
          },
        ),
      );
      if (response.statusCode == 200) {
        return ResponseUpdateproductModel.fromJson(response.data);
      } else {
        print("Failed update product: ${response.statusMessage}");
        return null;
      }
    } on DioException catch (e) {
      print("Error occurred: $e");
      return null;
    }
  }
}
