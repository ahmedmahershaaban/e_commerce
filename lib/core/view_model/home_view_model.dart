import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce/models/catrgory_model.dart';
import 'package:get/get.dart';

class HomeViewModel extends GetxController {
  HomeViewModel() {
    getCategory();
  }
  final CollectionReference _categoryCollectionReference =
      FirebaseFirestore.instance.collection("Category");

  List<CategoryModel> get categoryModel => _categoryModel;
  List<CategoryModel> _categoryModel = [];

  Future<void> getCategory() async {
    await _categoryCollectionReference.get().then((value) {
      for (int i = 0; i < value.docs.length; i++) {
        _categoryModel.add(CategoryModel.fromJson(value.docs[i].data() as Map));
      }
      print(categoryModel);
      update();
    });
  }
}
