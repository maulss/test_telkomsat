import 'package:dio/dio.dart';
import 'package:test_telkomsat2/constants/api_constant.dart';
import 'package:test_telkomsat2/models/response_products_model.dart';

class ProductsService {
  final Dio _dio = Dio();
  Future<ResponseProductsModel?> getProducts() async {
    try {
      final response = await _dio.get("${ApiConstant.baseUrl}/products");
      if (response.statusCode == 200) {
        return ResponseProductsModel.fromJson(response.data);
      } else {
        print("Failed get data: ${response.statusMessage}");
        return null;
      }
    } on DioException catch (e) {
      print("Error occurred: $e");
      return null;
    }
  }
}
