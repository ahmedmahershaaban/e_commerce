import 'package:e_commerce/core/service/database/cart_database_helper.dart';
import 'package:e_commerce/models/cart_product_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class CartViewModel extends GetxController {
  ValueNotifier<bool> get isLoading => _isLoading;
  ValueNotifier<bool> _isLoading = ValueNotifier(false);

  List<CartProductModel> get cartProductModel => _cartProductModel;
  List<CartProductModel> _cartProductModel = [];

  double? get totalPrice => _totalPrice;
  double? _totalPrice = 0.0;

  CartViewModel() {
    getAllProducts();
  }

  getAllProducts() async {
    _isLoading.value = true;
    final dbHelper = CartDatabaseHelper.db;
    _cartProductModel = await dbHelper.getAllProducts();
    getTotalPrice();
    _isLoading.value = false;
    update();
  }

  addProduct(CartProductModel model) async {
    final dbHelper = CartDatabaseHelper.db;
    for (int i = 0; i < _cartProductModel.length; i++) {
      if (model.id == _cartProductModel[i].id) {
        _cartProductModel[i].quantity =
            _cartProductModel[i].quantity! + model.quantity!;
        updateProduct(_cartProductModel[i]);
        getTotalPrice();

        update();
        return;
      }
    }
    _cartProductModel.add(model);
    await dbHelper.insert(model);
    getTotalPrice();

    update();
  }

  updateProduct(CartProductModel cartProductModel) async {
    final dbHelper = CartDatabaseHelper.db;
    await dbHelper.update(cartProductModel);
    update();
  }

  deleteProduct(int id) async {
    final dbHelper = CartDatabaseHelper.db;
    await dbHelper.delete(id);
    for (int i = 0; i < _cartProductModel.length; i++) {
      print(_cartProductModel[i].id);
    }
    getAllProducts();

    update();
  }

  getTotalPrice() {
    double price = 0.0;
    for (var cartProduct in _cartProductModel) {
      price = (cartProduct.price! * cartProduct.quantity!) + price;
    }
    _totalPrice = double.parse(price.toStringAsFixed(2));
    update();
  }
}
