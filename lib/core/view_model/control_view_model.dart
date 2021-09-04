import 'package:e_commerce/view/screens/chat/chat_screen.dart';
import 'package:e_commerce/view/screens/favorite/favorite_screen.dart';
import 'package:e_commerce/view/screens/home/home_screen.dart';
import 'package:e_commerce/view/screens/profile/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ControlViewModel extends GetxController {
  int _navigatorValue = 0;
  get navigatorValue => _navigatorValue;

  Widget _selectedWidget = HomeScreen();
  get selectedWidget => _selectedWidget;

  void changeSelectedValue(int selectedValue) {
    _navigatorValue = selectedValue;
    switch (selectedValue) {
      case 0:
        _selectedWidget = HomeScreen();
        break;
      case 1:
        _selectedWidget = FavoriteScreen();
        break;
      case 2:
        _selectedWidget = ChatScreen();
        break;
      case 3:
        _selectedWidget = ProfileScreen();
        break;
    }
    update();
  }
}
