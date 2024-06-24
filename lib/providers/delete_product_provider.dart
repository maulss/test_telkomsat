import 'package:flutter/material.dart';
import 'package:test_telkomsat2/models/response_delete_product_model.dart';
import 'package:test_telkomsat2/services/delete_product_service.dart';

class DeleteProductProvider extends ChangeNotifier {
  ResponseDeteleproductModel? _deleteProductData;
  ResponseDeteleproductModel? get deleteProductData => _deleteProductData;
  bool _isLoading = false;
  bool get isLoading => _isLoading;
  String? _error;
  String? get error => _error;

  DeleteProductService deleteProductService = DeleteProductService();

  Future<void> deleteProduct(int id) async {
    _isLoading = true;
    notifyListeners();
    try {
      final response = await deleteProductService.deleteProduct(id);
      if (response != null) {
        _deleteProductData = response;
        print(_deleteProductData);
      } else {
        _error = "data kosong";
      }
    } catch (e) {
      _error = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
