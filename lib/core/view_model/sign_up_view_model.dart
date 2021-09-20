import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

class SignUpViewModel extends GetxController {
  List<String> get errors => _errors;
  List<String> _errors = [];

  void addError(error) {
    _errors.add(error);
    update();
  }

  void removeError(error) {
    _errors.remove(error);
    update();
  }
}
