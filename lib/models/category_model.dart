class CategoryModel {
  String? text, image;

  CategoryModel({this.text, this.image});

  CategoryModel.fromJson(Map<dynamic, dynamic>? map) {
    if (map == null) {
      return;
    }
    text = map['text'];
    image = map['image'];
  }

  toJson() {
    return {
      'text': text,
      'image': image,
    };
  }
}
