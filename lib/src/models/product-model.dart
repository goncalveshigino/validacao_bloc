// To parse this JSON data, do
//
//     final productModel = productModelFromJson(jsonString);

import 'dart:convert';

ProductModel productModelFromJson(String str) => ProductModel.fromJson(json.decode(str));

String productModelToJson(ProductModel data) => json.encode(data.toJson());

class ProductModel {
    ProductModel({
        this.id,
        this.title,
        this.price,
        this.available,
        this.urlPhoto,
    });

    String id;
    String title;
    double price;
    bool available;
    String urlPhoto;

    factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        id       : json["id"],
        title    : json["title"],
        price    : json["price"],
        available: json["available"],
        urlPhoto : json["urlPhoto"],
    );

    Map<String, dynamic> toJson() => {
        "id"        : id,
        "title"     : title,
        "price"     : price,
        "available" : available,
        "urlPhoto"  : urlPhoto,
    };
}
