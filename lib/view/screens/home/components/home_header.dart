import 'package:e_commerce/core/view_model/cart_view_model.dart';
import 'package:e_commerce/view/screens/cart/cart_screen.dart';
import 'package:e_commerce/view/screens/home/components/search_field.dart';
import 'package:e_commerce/view/screens/notification/notification_screen.dart';
import 'package:flutter/material.dart';

import 'package:e_commerce/size_config.dart';
import 'package:get/get.dart';
import 'icon_btn_with_counter.dart';

class HomeHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SearchField(),
          GetBuilder<CartViewModel>(
            init: Get.find<CartViewModel>(),
            builder: (controller) => IconBtnWithCounter(
              svgAsset: "assets/icons/Cart Icon.svg",
              press: () {
                Get.to(CartScreen());
              },
              number: controller.cartProductModel.length,
            ),
          ),
          IconBtnWithCounter(
            svgAsset: "assets/icons/Bell.svg",
            press: () {
              Get.to(NotificationScreen());
            },
          ),
          Container(
            color: Colors.black,
          )
        ],
      ),
    );
  }
}
