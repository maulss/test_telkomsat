// To parse this JSON data, do
//
//     final responseAddproductModel = responseAddproductModelFromJson(jsonString);

import 'dart:convert';

ResponseAddproductModel responseAddproductModelFromJson(String str) => ResponseAddproductModel.fromJson(json.decode(str));

String responseAddproductModelToJson(ResponseAddproductModel data) => json.encode(data.toJson());

class ResponseAddproductModel {
    int? id;
    String? title;
    double? price;
    int? stock;
    String? description;
    String? category;

    ResponseAddproductModel({
        this.id,
        this.title,
        this.price,
        this.stock,
        this.description,
        this.category,
    });

    factory ResponseAddproductModel.fromJson(Map<String, dynamic> json) => ResponseAddproductModel(
        id: json["id"],
        title: json["title"],
        price: json["price"]?.toDouble(),
        stock: json["stock"],
        description: json["description"],
        category: json["category"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "price": price,
        "stock": stock,
        "description": description,
        "category": category,
    };
}
