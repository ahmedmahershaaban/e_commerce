import 'package:e_commerce/core/view_model/auth_view_model.dart';
import 'package:e_commerce/core/view_model/control_view_model.dart';
import 'package:e_commerce/view/components/custom_bottom_nav_bar.dart';
import 'package:e_commerce/view/screens/splash/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ControlView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return (Get.find<AuthViewModel>().user == null)
          ? SplashScreen()
          : GetBuilder<ControlViewModel>(
              init: ControlViewModel(),
              builder: (controller) => Scaffold(
                    body: controller.selectedWidget,
                    bottomNavigationBar: CustomBottomNavBar(),
                  ));
    });
  }
}
