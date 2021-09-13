import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class DetailsViewModel extends GetxController {
  @override
  void onInit() {
    super.onInit();
  }

  int get selectedImage => _selectedImage;
  int _selectedImage = 0;
  int get selectedColor => _selectedColor;
  int _selectedColor = 0;
  int get numberOfItems => _numberOfItems;
  int _numberOfItems = 1;
  int? get maxLines => _maxLines;
  int? _maxLines = 3;

  ValueNotifier<bool> get isFavourite => _isFavourite;
  ValueNotifier<bool> _isFavourite = ValueNotifier(false);

  selectColor(int index) {
    _selectedColor = index;
    update();
  }

  decreaseNumberOfItems() {
    if (_numberOfItems == 1 || _numberOfItems < 1) {
      _numberOfItems = 1;
    } else {
      _numberOfItems--;
    }
    update();
  }

  increaseNumberOfItems() {
    _numberOfItems++;

    update();
  }

  selectImage(int index) {
    _selectedImage = index;
    update();
  }

  seeMoreDetailsClicked() {
    _maxLines = null;
    update();
  }

  getItemsCountNumber(index) {
    print("HI");
    _numberOfItems = index;
    update();
  }
}
