import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_telkomsat2/providers/products_provider.dart';

class PriceWidget extends StatelessWidget {
  const PriceWidget(
      {super.key,
      required this.index,
      this.fontSizeDiscount,
      this.fontSizePrice});
  final int index;
  final double? fontSizeDiscount;
  final double? fontSizePrice;

  @override
  Widget build(BuildContext context) {
    final productsProvider = Provider.of<ProductsProvider>(context);
    var dataProduct = productsProvider.productsData?.products?[index];
    double priceDiscount = (dataProduct?.price ?? 0) *
        (dataProduct?.discountPercentage ?? 0) /
        100;
    return Row(
      children: [
        Text(
          "\$ ${((dataProduct?.price ?? 0) - priceDiscount).toStringAsFixed(2)}",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: fontSizePrice,
          ),
        ),
        const SizedBox(
          width: 5,
        ),
        Text(
          " ${dataProduct?.price}",
          style: TextStyle(
            decoration: TextDecoration.lineThrough,
            fontSize: fontSizeDiscount,
          ),
        ),
        const SizedBox(
          width: 5,
        ),
        Text(
          " -${dataProduct?.discountPercentage}%",
          style: TextStyle(
            color: Colors.red,
            fontSize: fontSizeDiscount,
          ),
        ),
      ],
    );
  }
}