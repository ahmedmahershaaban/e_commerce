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
    @required this.category,
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
  String? title, description, category;

  factory ProductModel.fromJson(Map<dynamic, dynamic> json) => ProductModel(
        images: List<String>.from(json["images"].map((x) => x)),
        price: json["price"].toDouble(),
        rating: json["rating"].toDouble(),
        isPopular: json["isPopular"],
        description: json["description"],
        id: json["id"],
        title: json["title"],
        category: json["category"],
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
        "category": category,
        "isFavourite": isFavourite,
        "colors": List<dynamic>.from(colors!.map((x) => x)),
      };
}
