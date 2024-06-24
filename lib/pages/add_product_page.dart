import 'package:flutter/material.dart';
import 'package:test_telkomsat2/widgets/text_field_widget.dart';

class AddProductPage extends StatelessWidget {
  const AddProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Add Product"),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            TextFieldWidget(
              labelText: "Title",
            ),
            const SizedBox(
              height: 10,
            ),
            TextFieldWidget(
              labelText: "Category",
            ),
            const SizedBox(
              height: 10,
            ),
            TextFieldWidget(
              labelText: "Price",
            ),
            const SizedBox(
              height: 10,
            ),
            TextFieldWidget(
              labelText: "Stock",
            ),
            const SizedBox(
              height: 10,
            ),
            TextFieldWidget(
              labelText: "Description",
              maxLines: null,
            ),
            const SizedBox(
              height: 16,
            ),
            ElevatedButton(
              onPressed: () {},
              child: const Text("Add Product"),
            )
          ],
        ),
      ),
    );
  }
}
