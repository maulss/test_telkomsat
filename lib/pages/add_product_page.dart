import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_telkomsat2/providers/add_product_provider.dart';
import 'package:test_telkomsat2/widgets/text_field_widget.dart';

class AddProductPage extends StatefulWidget {
  AddProductPage({super.key});

  @override
  State<AddProductPage> createState() => _AddProductPageState();
}

class _AddProductPageState extends State<AddProductPage> {
  TextEditingController titleControl = TextEditingController();

  TextEditingController categoryControl = TextEditingController();

  TextEditingController priceControl = TextEditingController();

  TextEditingController stockControl = TextEditingController();

  TextEditingController descriptionControl = TextEditingController();

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
    final addProductProvider = Provider.of<AddProductProvider>(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Add Product"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16),
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
                      addProductProvider.addProduct(
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
                  child: addProductProvider.isLoading
                      ? const Center(
                          child: CircularProgressIndicator(),
                        )
                      : const Text("Add Product"),
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              addProductProvider.addProductData == null
                  ? Container()
                  : Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Title : ${addProductProvider.addProductData?.title}",
                          style: const TextStyle(fontSize: 18),
                        ),
                        Text(
                          "Category : ${addProductProvider.addProductData?.category}",
                          style: const TextStyle(fontSize: 18),
                        ),
                        Text(
                          "Price : ${addProductProvider.addProductData?.price}",
                          style: const TextStyle(fontSize: 18),
                        ),
                        Text(
                          "Stock : ${addProductProvider.addProductData?.stock}",
                          style: const TextStyle(fontSize: 18),
                        ),
                        Text(
                          "Description : ${addProductProvider.addProductData?.description}",
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
