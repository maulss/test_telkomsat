import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_telkomsat2/pages/profile_page.dart';
import 'package:test_telkomsat2/providers/products_provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<ProductsProvider>(context, listen: false).getProducts();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final productsProvider = Provider.of<ProductsProvider>(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Home Page"),
        actions: [
          IconButton(
            onPressed: () async {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ProfilePage(),
                ),
              );
            },
            icon: const Icon(Icons.person),
          )
        ],
      ),
      body: productsProvider.isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : productsProvider.error != null
              ? Center(
                  child: Text("${productsProvider.error}"),
                )
              : GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.8,
                  ),
                  itemCount:
                      productsProvider.productsData?.products?.length ?? 0,
                  itemBuilder: (context, index) {
                    var dataProduct =
                        productsProvider.productsData?.products?[index];
                    double priceDiscount = (dataProduct?.price ?? 0) *
                        (dataProduct?.discountPercentage ?? 0) /
                        100;
                    return GestureDetector(
                      onTap: () {},
                      child: Container(
                        margin: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          color: const Color.fromARGB(255, 230, 224, 224),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(4),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                alignment: Alignment.center,
                                height: 120,
                                color: const Color.fromARGB(255, 156, 154, 154),
                                child: dataProduct?.thumbnail != null
                                    ? Image.network(
                                        "${dataProduct?.thumbnail}",
                                        fit: BoxFit.fill,
                                      )
                                    : const Icon(Icons.add_box),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(4),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "${dataProduct?.title}",
                                      style: const TextStyle(
                                        fontWeight: FontWeight.w500,
                                        overflow: TextOverflow.ellipsis,
                                        fontSize: 15.5,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          "\$ ${((dataProduct?.price ?? 0) - priceDiscount).toStringAsFixed(2)}",
                                          style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 14,
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 5,
                                        ),
                                        Text(
                                          " ${dataProduct?.price}",
                                          style: const TextStyle(
                                            decoration:
                                                TextDecoration.lineThrough,
                                            fontSize: 12,
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 5,
                                        ),
                                        Text(
                                          " -${dataProduct?.discountPercentage}%",
                                          style: const TextStyle(
                                            color: Colors.red,
                                            fontSize: 12,
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Row(
                                      children: [
                                        const Icon(
                                          Icons.star,
                                          size: 14,
                                          color: Colors.orange,
                                        ),
                                        const SizedBox(
                                          width: 3,
                                        ),
                                        Text(
                                          "${dataProduct?.rating} |",
                                          style: const TextStyle(
                                            fontSize: 11,
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 3,
                                        ),
                                        Text(
                                          "${dataProduct?.stock} Stocks",
                                          style: const TextStyle(
                                            fontSize: 11,
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 7,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          dataProduct?.brand != null
                                              ? "${dataProduct?.brand}"
                                              : "-",
                                          style:
                                              const TextStyle(fontSize: 13.5),
                                        ),
                                        GestureDetector(
                                          onTap: () {},
                                          child: const Icon(Icons.more_vert),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
    );
  }
}
