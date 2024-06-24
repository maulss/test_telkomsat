import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_telkomsat2/providers/detail_product_provider.dart';
import 'package:test_telkomsat2/providers/update_product_provider.dart';
import 'package:test_telkomsat2/widgets/text_field_widget.dart';

class UpdateProductPage extends StatefulWidget {
  UpdateProductPage({super.key, required this.id});
  final int id;

  @override
  State<UpdateProductPage> createState() => _UpdateProductPageState();
}

class _UpdateProductPageState extends State<UpdateProductPage> {
  TextEditingController titleControl = TextEditingController();
  TextEditingController categoryControl = TextEditingController();
  TextEditingController priceControl = TextEditingController();
  TextEditingController stockControl = TextEditingController();
  TextEditingController descriptionControl = TextEditingController();

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<DetailProductProvider>(context, listen: false)
          .getDetailProduct(widget.id);
    });
    super.initState();
  }

  @override
  void dispose() {
    titleControl.dispose();
    categoryControl.dispose();
    priceControl.dispose();
    stockControl.dispose();
    descriptionControl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final updateproductProvider = Provider.of<UpdateProductProvider>(context);
    final detailProductProvider = Provider.of<DetailProductProvider>(context);
    titleControl.text = detailProductProvider.detailProductData?.title ?? "";
    categoryControl.text =
        detailProductProvider.detailProductData?.category ?? "";
    priceControl.text =
        detailProductProvider.detailProductData?.price?.toString() ?? "";
    stockControl.text =
        detailProductProvider.detailProductData?.stock?.toString() ?? "";
    descriptionControl.text =
        detailProductProvider.detailProductData?.description ?? "";
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
              updateproductProvider.resetUpdateProductData();
            },
            icon: const Icon(Icons.arrow_back)),
        centerTitle: true,
        title: const Text("Update Product"),
      ),
      body: detailProductProvider.isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextFieldWidget(
                      controller: titleControl,
                      labelText: "Title",
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFieldWidget(
                      controller: categoryControl,
                      labelText: "Category",
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFieldWidget(
                      keyboardType: TextInputType.number,
                      controller: priceControl,
                      labelText: "Price",
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFieldWidget(
                      keyboardType: TextInputType.number,
                      controller: stockControl,
                      labelText: "Stock",
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFieldWidget(
                      controller: descriptionControl,
                      labelText: "Description",
                      maxLines: null,
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Center(
                      child: ElevatedButton(
                        onPressed: () {
                          if (titleControl.text.isNotEmpty ||
                              categoryControl.text.isNotEmpty ||
                              priceControl.text.isNotEmpty ||
                              stockControl.text.isNotEmpty ||
                              descriptionControl.text.isNotEmpty) {
                            updateproductProvider.updateProduct(
                              widget.id,
                              titleControl.text,
                              categoryControl.text,
                              double.parse(priceControl.text),
                              int.parse(stockControl.text),
                              descriptionControl.text,
                            );
                            titleControl.clear();
                            categoryControl.clear();
                            priceControl.clear();
                            stockControl.clear();
                            descriptionControl.clear();
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                duration: Duration(seconds: 1),
                                content: Text("form tidak boleh kosong"),
                              ),
                            );
                          }
                        },
                        child: updateproductProvider.islOading
                            ? const Center(
                                child: CircularProgressIndicator(),
                              )
                            : const Text("Update Product"),
                      ),
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    updateproductProvider.updateProductdata == null
                        ? Container()
                        : Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Title : ${updateproductProvider.updateProductdata?.title}",
                                style: const TextStyle(fontSize: 18),
                              ),
                              Text(
                                "Category : ${updateproductProvider.updateProductdata?.category}",
                                style: const TextStyle(fontSize: 18),
                              ),
                              Text(
                                "Price : ${updateproductProvider.updateProductdata?.price}",
                                style: const TextStyle(fontSize: 18),
                              ),
                              Text(
                                "Stock : ${updateproductProvider.updateProductdata?.stock}",
                                style: const TextStyle(fontSize: 18),
                              ),
                              Text(
                                "Description : ${updateproductProvider.updateProductdata?.description}",
                                style: const TextStyle(fontSize: 18),
                              ),
                            ],
                          )
                  ],
                ),
              ),
            ),
    );
  }
}
