import 'package:flutter/material.dart';

class BannerModel {
  String? title, image;
  int? numOfBrands;
  BannerModel({
    @required this.image,
    @required this.numOfBrands,
    @required this.title,
  });

  BannerModel.fromJson(Map<dynamic, dynamic>? map) {
    if (map == null) {
      return;
    }
    title = map['title'];
    numOfBrands = map['numOfBrands'];
    image = map['image'];
  }

  toJson() {
    return {
      'title': title,
      'numOfBrands': numOfBrands,
      'image': image,
    };
  }
}
