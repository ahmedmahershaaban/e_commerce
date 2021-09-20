import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class SignInViewModel extends GetxController {
  ValueNotifier<bool> get rememberMe => _rememberMe;
  ValueNotifier<bool> _rememberMe = ValueNotifier(false);

  List<String> get errors => _errors;
  List<String> _errors = [];

  void changeRememberMe(bool value) {
    _rememberMe.value = value;
    update();
  }

  void addError(error) {
    _errors.add(error);
    update();
  }

  void removeError(error) {
    _errors.remove(error);
    update();
  }
}
