import 'package:e_commerce/models/product_model.dart';

class Cart {
  final ProductModel product;
  final int numberOfItems;

  Cart({required this.product, required this.numberOfItems});
}

//demo data for the app
List<Cart> demoCart = [
  // Cart(product: demoProducts[0], numberOfItems: 3),
  // Cart(product: demoProducts[1], numberOfItems: 7),
  // Cart(product: demoProducts[2], numberOfItems: 2),
  // Cart(product: demoProducts[3], numberOfItems: 1),
  // Cart(product: demoProducts[0], numberOfItems: 2),
  // Cart(product: demoProducts[1], numberOfItems: 3),
  // Cart(product: demoProducts[2], numberOfItems: 1),
  // Cart(product: demoProducts[3], numberOfItems: 12),
];
