class CartProductModel {
  String? title, color, image;
  int? id, quantity;
  double? price;

  CartProductModel({
    required this.image,
    required this.title,
    required this.price,
    required this.id,
    required this.color,
    required this.quantity,
  });

  CartProductModel.fromJson(Map<dynamic, dynamic>? map) {
    if (map == null) return;
    title = map['title'];
    color = map['color'];
    image = map['image'];
    id = map['id'];
    price = map['price'] + 0.0;
    quantity = map['quantity'];
  }
  toJson() {
    return {
      'title': title,
      'color': color,
      'image': image,
      'id': id,
      'price': price,
      'quantity': quantity
    };
  }
}
