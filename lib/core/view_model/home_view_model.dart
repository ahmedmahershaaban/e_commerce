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

  List<ProductModel>? get searchBar => _searchBar;
  List<ProductModel> _searchBar = [];

  List<ProductModel>? get filteredProductModel => _filteredProductModel;
  List<ProductModel> _filteredProductModel = [];
  String _kindOfFilter = "isFavourite";

  changeFilteredIsFavorite(id) async {
    for (int i = 0; i < _productModel.length; i++) {
      if (_productModel[i].id == id) {
        _productModel[i].isFavourite = !_productModel[i].isFavourite;
        filteredProducts(_kindOfFilter);
        await HomeService().updateFavoriteHeart(
            docId: _productModel[i].id.toString(),
            value: _productModel[i].isFavourite);
        update();
        return;
      }
    }
  }

  filteredProducts(String category) {
    _kindOfFilter = category;
    _filteredProductModel = [];
    if (_kindOfFilter == "isFavourite") {
      for (ProductModel model in _productModel) {
        if (model.isFavourite) {
          _filteredProductModel.add(model);
        }
      }
      update();
      return;
    } else {
      for (ProductModel model in _productModel) {
        if (model.category == category) {
          _filteredProductModel.add(model);
        }
      }
      update();
    }
  }

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
      filteredProducts(_kindOfFilter);
      update();
    });
  }

  addProductToFirebase() {
    HomeService().addProductToFirebase();
  }

  searchProducts(String searchWord) {
    _searchBar = [];
    _searchBar = _productModel
        .where((searchProductModel) => searchProductModel.title!
            .toLowerCase()
            .contains(searchWord.toLowerCase()))
        .toList();
    update();
  }
}
