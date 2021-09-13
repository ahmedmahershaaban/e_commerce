import 'package:e_commerce/core/view_model/home_view_model.dart';
import 'package:flutter/material.dart';

import 'package:e_commerce/constants.dart';
import 'package:e_commerce/size_config.dart';
import 'package:get/get.dart';

class SearchField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: SizeConfig.screenWidth * 0.6, //60% of width
      decoration: BoxDecoration(
        color: kTextColor.withOpacity(0.1),
        borderRadius: BorderRadius.circular(15),
      ),
      child: TextField(
        onChanged: (value) {
          Get.find<HomeViewModel>().searchProducts(value);
          // value
        },
        decoration: InputDecoration(
          hintText: "Search Product",
          border: InputBorder.none,
          focusedBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(
            horizontal: getProportionateScreenWidth(20),
            vertical: getProportionateScreenHeight(9),
          ),
          prefixIcon: Icon(Icons.search),
        ),
      ),
    );
  }
}
