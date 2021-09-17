import 'package:e_commerce/core/view_model/home_view_model.dart';
import 'package:e_commerce/view/screens/home/components/popular_product.dart';
import 'package:e_commerce/view/screens/home/components/search_bar_menu.dart';
import 'package:e_commerce/view/screens/home/components/special_for_you.dart';
import 'package:e_commerce/size_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'categories.dart';
import 'discount_banner.dart';
import 'home_header.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeViewModel>(
      init: Get.find<HomeViewModel>(),
      builder: (controller) => SafeArea(
        child: ListView(
          children: [
            SizedBox(height: getProportionateScreenWidth(20)),
            HomeHeader(),
            SizedBox(height: getProportionateScreenWidth(30)),
            controller.isLoadingSearch.value
                ? SearchBarMenu()
                : Container(
                    height: SizeConfig.screenHeight * 0.77,
                    child: ListView.builder(
                      itemCount: searchBarController.length,
                      itemBuilder: (context, index) =>
                          searchBarController[index],
                    ),
                  )
          ],
        ),
      ),
    );
  }

  List<Widget> searchBarController = [
    DiscountBanner(),
    SizedBox(height: getProportionateScreenWidth(30)),
    Categories(),
    SizedBox(height: getProportionateScreenWidth(30)),
    SpecialForYou(),
    SizedBox(height: getProportionateScreenWidth(30)),
    PopularProduct(),
    SizedBox(height: getProportionateScreenWidth(30)),
  ];
}
