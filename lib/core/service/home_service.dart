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
}
