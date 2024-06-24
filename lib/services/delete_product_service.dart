import 'package:dio/dio.dart';
import 'package:test_telkomsat2/constants/api_constant.dart';
import 'package:test_telkomsat2/models/response_delete_product_model.dart';

class DeleteProductService {
  final Dio _dio = Dio();
  Future<ResponseDeteleproductModel?> deleteProduct(int id) async {
    try {
      final response = await _dio.delete("${ApiConstant.baseUrl}/products/$id");
      if (response.statusCode == 200) {
        return ResponseDeteleproductModel.fromJson(response.data);
      } else {
        print("Failed delete product: ${response.statusMessage}");
        return null;
      }
    } on DioException catch (e) {
      print("Error occurred: $e");
      return null;
    }
  }
}
