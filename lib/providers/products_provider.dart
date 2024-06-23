import 'package:flutter/material.dart';
import 'package:test_telkomsat2/models/response_products_model.dart';
import 'package:test_telkomsat2/services/products_service.dart';

class ProductsProvider extends ChangeNotifier {
  ResponseProductsModel? _productsData;
  ResponseProductsModel? get productsData => _productsData;
  String? _error;
  String? get error => _error;
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  ProductsService productsService = ProductsService();

  void getProducts() async {
    _isLoading = true;
    notifyListeners();
    try {
      final response = await productsService.getProducts();
      if (response?.products != null) {
        _productsData = response;
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
