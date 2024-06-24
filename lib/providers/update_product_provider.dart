import 'package:flutter/material.dart';
import 'package:test_telkomsat2/models/response_update_product_model.dart';
import 'package:test_telkomsat2/services/update_product_service.dart';

class UpdateProductProvider extends ChangeNotifier {
  ResponseUpdateproductModel? _updateProductdata;
  ResponseUpdateproductModel? get updateProductdata => _updateProductdata;
  bool _isLoading = false;
  bool get islOading => _isLoading;
  String? _error;
  String? get error => _error;

  UpdateProductService updateProductProvider = UpdateProductService();

  void updateProduct(int id, String title, String category, double price,
      int stock, String description) async {
    _isLoading = true;
    notifyListeners();
    try {
      final response = await updateProductProvider.updateproduct(
          id, title, category, price, stock, description);
      if (response != null) {
        _updateProductdata = response;
        print(_updateProductdata);
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

  void resetUpdateProductData() {
    _updateProductdata = null;
    notifyListeners();
  }
}
