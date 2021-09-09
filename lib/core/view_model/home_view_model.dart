import 'package:e_commerce/core/service/home_service.dart';
import 'package:e_commerce/models/banner_model.dart';
import 'package:e_commerce/models/category_model.dart';
import 'package:e_commerce/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeViewModel extends GetxController {
  HomeViewModel() {
    getCategory();
    getBanner();
    getProduct();
  }

  ValueNotifier<bool> get isLoadingCategory => _isLoadingCategory;
  ValueNotifier<bool> _isLoadingCategory = ValueNotifier(false);
  ValueNotifier<bool> get isLoadingBanner => _isLoadingBanner;
  ValueNotifier<bool> _isLoadingBanner = ValueNotifier(false);
  ValueNotifier<bool> get isLoadingProduct => _isLoadingProduct;
  ValueNotifier<bool> _isLoadingProduct = ValueNotifier(false);

  List<CategoryModel>? get categoryModel => _categoryModel;
  List<CategoryModel> _categoryModel = [];

  List<BannerModel>? get bannerModel => _bannerModel;
  List<BannerModel> _bannerModel = [];

  List<ProductModel>? get productModel => _productModel;
  List<ProductModel> _productModel = [];

  Future<void> getCategory() async {
    _isLoadingCategory.value = true;
    await HomeService().getCategory().then((value) {
      for (int i = 0; i < value.length; i++) {
        _categoryModel.add(CategoryModel.fromJson(value[i].data() as Map));
      }
      _isLoadingCategory.value = false;
      update();
    });
  }

  Future<void> getBanner() async {
    _isLoadingBanner.value = true;
    await HomeService().getBanner().then((value) {
      for (int i = 0; i < value.length; i++) {
        _bannerModel.add(BannerModel.fromJson(value[i].data() as Map));
      }
      _isLoadingBanner.value = false;
      update();
    });
  }

  Future<void> getProduct() async {
    _isLoadingProduct.value = true;
    await HomeService().getProduct().then((value) {
      for (int i = 0; i < value.length; i++) {
        _productModel.add(ProductModel.fromJson(value[i].data() as Map));
      }
      _isLoadingProduct.value = false;
      update();
    });
  }
}
