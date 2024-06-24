import 'package:dio/dio.dart';
import 'package:test_telkomsat2/constants/api_constant.dart';
import 'package:test_telkomsat2/models/response_detail_product_model.dart';

class DetailProductService {
  final Dio _dio = Dio();
  Future<ResponseDetailProductModel?> getDetailProduct(int id) async {
    try {
      final response = await _dio.get("${ApiConstant.baseUrl}/products/$id");
      if (response.statusCode == 200) {
        return ResponseDetailProductModel.fromJson(response.data);
      } else {
        print("Failed get detail product: ${response.statusMessage}");
        return null;
      }
    } on DioException catch (e) {
      print("Error occurred: $e");
      return null;
    }
  }
}
