import 'package:cloud_firestore/cloud_firestore.dart';

class HomeService {
  final CollectionReference _categoryCollectionReference =
      FirebaseFirestore.instance.collection("Category");

  final CollectionReference _bannerCollectionReference =
      FirebaseFirestore.instance.collection("Banner");

  final CollectionReference _productCollectionReference =
      FirebaseFirestore.instance.collection("Product");

  Future<List<QueryDocumentSnapshot>> getCategory() async {
    var value = await _categoryCollectionReference.get();
    return value.docs;
  }

  Future<List<QueryDocumentSnapshot>> getBanner() async {
    var value = await _bannerCollectionReference.get();
    return value.docs;
  }

  Future<List<QueryDocumentSnapshot>> getProduct() async {
    var value = await _productCollectionReference.get();
    return value.docs;
  }

  updateFavoriteHeart({required String docId, required bool value}) async {
    await _productCollectionReference
        .doc(docId)
        .update({"isFavourite": value})
        .then((value) => print("User Updated"))
        .catchError((error) => print("Failed to update user: $error"));
  }

  Future<void> addProductToFirebase() async {
//     int id = 87;
//     ProductModel productModel = ProductModel(
//       images: [
//         "https://firebasestorage.googleapis.com/v0/b/e-commerce-resume.appspot.com/o/products%2FBS-MALL%20Makeup%20Brush%20Set%2018%20Pcs%20Premium%20Synthetic%20Foundation%20Powder%20Concealers%2F0.png?alt=media&token=a40b208e-5e17-4066-961c-69661b5782d9",
//       ],
//       price: 12.99,
//       rating: 4.7,
//       category: "makeup brushes",
//       isPopular: false,
//       description: '''
// PROFESSIONAL MAKEUP BRUSH SET: Cover 18pcs brushes for Eye Shadow, Crease Shadow, Concealer, Blush, Foundation, Pressed or Loose Powders, Highlighter & Eyebrows. Ideally for applying, blending and shading products. Easy and convenient for daily makeup use.
// PREMIUM SYNTHETIC FIBER: The handles of cosmetic brushes are made of high-end alloy and wood material. The bristles are well made of soft and silky nylon, ensured for long time use. All the brushes are fine and dense, suitable for even the most sensitive skin.
// STYLISH DESIGN: The 18 pcs makeup brush set looks very chic and fashionable with the most popular and elegant Champagne Gold color , a must-have in your cosmetic bag.
// IDEAL FOR GIFT: Intended for makeup beginners and enthusiasts as the makeup brush kit is easy to use and superior in quality at an affordable price, a complete assortment to allows you to keep your makeup. Ideal gift for mom, wife, female friends.
// ''',
//       id: id,
//       title:
//           "BS-MALL Makeup Brush Set 18 Pcs Premium Synthetic Foundation Powder Concealers Eye shadows Blush Makeup Brushes with black case ",
//       isFavourite: false,
//       colors: [
//         "Color(0xFF897473)",
//       ],
//     );

    // return await _productCollectionReference.doc(id.toString()).set(map);
  }
}
