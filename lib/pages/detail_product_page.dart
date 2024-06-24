import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_telkomsat2/providers/detail_product_provider.dart';
import 'package:test_telkomsat2/widgets/price_widget.dart';
import 'package:timeago/timeago.dart' as timeago;

class DetailProductPage extends StatefulWidget {
  const DetailProductPage({super.key, required this.id});
  final int id;
  @override
  State<DetailProductPage> createState() => _DetailProductPageState();
}

class _DetailProductPageState extends State<DetailProductPage> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<DetailProductProvider>(context, listen: false)
          .getDetailProduct(widget.id + 1);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final detailProductProvider = Provider.of<DetailProductProvider>(context);
    var detailProductData = detailProductProvider.detailProductData;
    return Scaffold(
      body: SafeArea(
        child: detailProductProvider.isLoading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : detailProductProvider.error != null
                ? Center(
                    child: Text("${detailProductProvider.error}"),
                  )
                : SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CarouselSlider.builder(
                          options: CarouselOptions(
                            height: 200,
                            viewportFraction: 1.0,
                          ),
                          itemCount: detailProductProvider.images.length,
                          itemBuilder: (context, index, realIndex) {
                            return Builder(
                              builder: (BuildContext context) {
                                return Container(
                                  color:
                                      const Color.fromARGB(255, 190, 188, 188),
                                  width: double.infinity,
                                  child: Stack(
                                    children: [
                                      Center(
                                          child:
                                              detailProductData?.images != null
                                                  ? Image.network(
                                                      detailProductProvider
                                                          .images[index],
                                                      fit: BoxFit.contain,
                                                      width: double.infinity,
                                                    )
                                                  : const Icon(Icons.add_box)),
                                      Positioned(
                                        top: 16,
                                        left: 16,
                                        child: GestureDetector(
                                          onTap: () {
                                            Navigator.pop(context);
                                          },
                                          child: const Icon(Icons.arrow_back),
                                        ),
                                      )
                                    ],
                                  ),
                                );
                              },
                            );
                          },
                        ),
                        Padding(
                          padding: const EdgeInsets.all(16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  PriceWidget(
                                    index: widget.id,
                                    fontSizeDiscount: 16,
                                    fontSizePrice: 18,
                                  ),
                                  Text(
                                    "${detailProductData?.stock} Stocks",
                                    style: const TextStyle(fontSize: 16),
                                  )
                                ],
                              ),
                              const SizedBox(
                                height: 6,
                              ),
                              Text(
                                detailProductData?.brand != null
                                    ? "${detailProductData?.brand}"
                                    : "-",
                                style: const TextStyle(fontSize: 15),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                "${detailProductData?.title}",
                                style: const TextStyle(fontSize: 18),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              const Text(
                                "Description",
                                style: TextStyle(fontSize: 16),
                              ),
                              const SizedBox(
                                height: 6,
                              ),
                              Text(
                                "${detailProductData?.description}",
                                style: const TextStyle(fontSize: 15),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              const Text(
                                "Spesification",
                                style: TextStyle(fontSize: 16),
                              ),
                              const SizedBox(
                                height: 6,
                              ),
                              const Text(
                                "Weight :",
                                style: TextStyle(fontSize: 14),
                              ),
                              Text(
                                "${detailProductData?.weight} kg",
                                style: const TextStyle(fontSize: 14),
                              ),
                              const SizedBox(
                                height: 6,
                              ),
                              const Text(
                                "Dimensions :",
                                style: TextStyle(fontSize: 14),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                      "Width : ${detailProductData?.dimensions?.width}"),
                                  Text(
                                      "Height : ${detailProductData?.dimensions?.height}"),
                                  Text(
                                      "Depth : ${detailProductData?.dimensions?.depth}"),
                                ],
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              const Text(
                                "Information :",
                                style: TextStyle(fontSize: 14),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                      "warranty : ${detailProductData?.warrantyInformation}"),
                                  Text(
                                      "shipping : ${detailProductData?.shippingInformation}"),
                                ],
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              const Text(
                                "Comments",
                                style: TextStyle(fontSize: 16),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      const Icon(
                                        Icons.star,
                                        size: 18,
                                        color: Colors.orange,
                                      ),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      Text("${detailProductData?.rating}")
                                    ],
                                  ),
                                  Text(
                                      "${detailProductData?.reviews?.length ?? 0} Riviews")
                                ],
                              ),
                              SizedBox(
                                height: 120,
                                width: double.infinity,
                                child: ListView.builder(
                                  itemCount:
                                      detailProductData?.reviews?.length ?? 0,
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder: (context, index) {
                                    var dataComments =
                                        detailProductData?.reviews?[index];
                                    return Container(
                                      margin: const EdgeInsets.only(
                                          right: 10, bottom: 10, top: 10),
                                      height: 120,
                                      width: 170,
                                      decoration: BoxDecoration(
                                        color: const Color.fromARGB(
                                            255, 224, 221, 221),
                                        borderRadius: BorderRadius.circular(4),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsets.all(5),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              children: [
                                                const Icon(
                                                  Icons.person,
                                                  size: 17,
                                                ),
                                                const SizedBox(
                                                  width: 3,
                                                ),
                                                Text(
                                                    "${dataComments?.reviewerName}"),
                                              ],
                                            ),
                                            const SizedBox(
                                              height: 5,
                                            ),
                                            Text("${dataComments?.comment}"),
                                            const SizedBox(
                                              height: 5,
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Row(
                                                  children: [
                                                    const Icon(
                                                      Icons.star,
                                                      size: 16,
                                                      color: Colors.orange,
                                                    ),
                                                    const SizedBox(
                                                      width: 3,
                                                    ),
                                                    Text(
                                                        "${dataComments?.rating}")
                                                  ],
                                                ),
                                                Text(
                                                  timeago.format(
                                                    DateTime.parse(
                                                        "${dataComments?.date}"),
                                                  ),
                                                  style: const TextStyle(
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.w300,
                                                  ),
                                                )
                                              ],
                                            )
                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
      ),
    );
  }
}
