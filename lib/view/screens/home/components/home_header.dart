import 'package:e_commerce/view/screens/cart/cart_screen.dart';
import 'package:e_commerce/view/screens/home/components/search_field.dart';
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
          IconBtnWithCounter(
            svgAsset: "assets/icons/Cart Icon.svg",
            press: () {
              Get.to(CartScreen());
            },
          ),
          IconBtnWithCounter(
            svgAsset: "assets/icons/Bell.svg",
            press: () {},
            number: 3,
          ),
        ],
      ),
    );
  }
}
