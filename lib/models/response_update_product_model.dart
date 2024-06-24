// To parse this JSON data, do
//
//     final responseUpdateproductModel = responseUpdateproductModelFromJson(jsonString);

import 'dart:convert';

ResponseUpdateproductModel responseUpdateproductModelFromJson(String str) =>
    ResponseUpdateproductModel.fromJson(json.decode(str));

String responseUpdateproductModelToJson(ResponseUpdateproductModel data) =>
    json.encode(data.toJson());

class ResponseUpdateproductModel {
  int? id;
  String? title;
  double? price;
  double? discountPercentage;
  int? stock;
  double? rating;
  List<String>? images;
  String? thumbnail;
  String? description;
  String? brand;
  String? category;

  ResponseUpdateproductModel({
    this.id,
    this.title,
    this.price,
    this.discountPercentage,
    this.stock,
    this.rating,
    this.images,
    this.thumbnail,
    this.description,
    this.brand,
    this.category,
  });

  factory ResponseUpdateproductModel.fromJson(Map<String, dynamic> json) =>
      ResponseUpdateproductModel(
        id: json["id"],
        title: json["title"],
        price: json["price"]?.toDouble(),
        discountPercentage: json["discountPercentage"]?.toDouble(),
        stock: json["stock"],
        rating: json["rating"]?.toDouble(),
        images: json["images"] == null
            ? []
            : List<String>.from(json["images"]!.map((x) => x)),
        thumbnail: json["thumbnail"],
        description: json["description"],
        brand: json["brand"],
        category: json["category"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "price": price,
        "discountPercentage": discountPercentage,
        "stock": stock,
        "rating": rating,
        "images":
            images == null ? [] : List<dynamic>.from(images!.map((x) => x)),
        "thumbnail": thumbnail,
        "description": description,
        "brand": brand,
        "category": category,
      };
}
