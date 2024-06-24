import 'package:flutter/material.dart';
import 'package:test_telkomsat2/models/response_add_product_model.dart';
import 'package:test_telkomsat2/services/add_product_service.dart';

class AddProductProvider extends ChangeNotifier {
  ResponseAddproductModel? _addProductData;
  ResponseAddproductModel? get addProductData => _addProductData;

  bool _isLoading = false;
  bool get isLoading => _isLoading;
  String? _error;
  String? get error => _error;

  AddProductService addProductService = AddProductService();

  void addProduct(String title, String category, double price, int stock,
      String description) async {
    _isLoading = true;
    notifyListeners();
    try {
      final response = await addProductService.addproduct(
          title, category, price, stock, description);
      if (response != null) {
        _addProductData = response;
        print(_addProductData);
      } else {}
    } catch (e) {
      _error = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
