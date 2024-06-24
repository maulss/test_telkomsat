import 'package:flutter/material.dart';
import 'package:test_telkomsat2/models/response_detail_product_model.dart';
import 'package:test_telkomsat2/services/detail_product_service.dart';

class DetailProductProvider extends ChangeNotifier {
  ResponseDetailProductModel? _detailProductData;
  ResponseDetailProductModel? get detailProductData => _detailProductData;
  bool _isLoading = false;
  bool get isLoading => _isLoading;
  String? _error;
  String? get error => _error;

  List<dynamic> _images = [];
  List<dynamic> get images => _images;

  DetailProductService detailProductService = DetailProductService();

  void getDetailProduct(int id) async {
    _isLoading = true;
    notifyListeners();
    try {
      final response = await detailProductService.getDetailProduct(id);
      if (response != null) {
        _detailProductData = response;
        _images = (response.images as List);
        print(_detailProductData);
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
