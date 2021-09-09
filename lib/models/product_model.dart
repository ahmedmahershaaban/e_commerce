import 'package:meta/meta.dart';
import 'dart:convert';

ProductModel productModelFromJson(String str) =>
    ProductModel.fromJson(json.decode(str));

String productModelToJson(ProductModel data) => json.encode(data.toJson());

class ProductModel {
  ProductModel({
    @required this.images,
    @required this.price,
    @required this.rating,
    required this.isPopular,
    @required this.description,
    @required this.id,
    @required this.title,
    required this.isFavourite,
    @required this.colors,
  });

  int? id;
  List<String>? images, colors;
  double? price, rating;
  bool isPopular = false, isFavourite = false;
  String? title, description;

  factory ProductModel.fromJson(Map<dynamic, dynamic> json) => ProductModel(
        images: List<String>.from(json["images"].map((x) => x)),
        price: json["price"].toDouble(),
        rating: json["rating"].toDouble(),
        isPopular: json["isPopular"],
        description: json["description"],
        id: json["id"],
        title: json["title"],
        isFavourite: json["isFavourite"],
        colors: List<String>.from(json["colors"].map((x) => x)),
      );

  Map<dynamic, dynamic> toJson() => {
        "images": List<dynamic>.from(images!.map((x) => x)),
        "price": price,
        "rating": rating,
        "isPopular": isPopular,
        "description": description,
        "id": id,
        "title": title,
        "isFavourite": isFavourite,
        "colors": List<dynamic>.from(colors!.map((x) => x)),
      };
}
// import 'package:flutter/material.dart';
//
// class ProductModel {
//   int? id;
//   String? title, description;
//   List<String>? images;
//   List<Color>? colors;
//   double? rating, price;
//   bool isFavourite = false;
//   bool isPopular = false;
//   ProductModel({
//     required this.title,
//     required this.id,
//     required this.price,
//     required this.colors,
//     required this.description,
//     required this.images,
//     required this.isFavourite,
//     required this.isPopular,
//     required this.rating,
//   });
//
//   ProductModel.fromJson(Map<dynamic, dynamic>? map) {
//     if (map == null) {
//       return;
//     }
//     id = map['id'];
//     // images = map['images'];
//     // colors = map['colors'];
//     images = [...map['images']];
//     colors = [...map['colors']];
//     rating = map['rating'];
//     isFavourite = map['isFavourite'];
//     isPopular = map['isPopular'];
//     title = map['title'];
//     price = map['price'];
//     description = map['description'];
//   }
//
//   toJson() {
//     return {
//       'id': id,
//       'images': images,
//       'colors': colors,
//       'rating': rating,
//       'isFavourite': isFavourite,
//       'isPopular': isPopular,
//       'title': title,
//       'price': price,
//       'description': description,
//     };
//   }
// }
