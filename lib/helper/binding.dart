import 'package:e_commerce/core/view_model/auth_view_model.dart';
import 'package:e_commerce/core/view_model/cart_view_model.dart';
import 'package:e_commerce/core/view_model/control_view_model.dart';
import 'package:e_commerce/core/view_model/details_view_model.dart';
import 'package:e_commerce/core/view_model/home_view_model.dart';
import 'package:get/get.dart';

class Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AuthViewModel());
    Get.lazyPut(() => ControlViewModel());
    Get.lazyPut(() => HomeViewModel());
    Get.lazyPut(() => DetailsViewModel());
    Get.lazyPut(() => CartViewModel());
  }
}
