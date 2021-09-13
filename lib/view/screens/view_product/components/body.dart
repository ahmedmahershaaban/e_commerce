import 'package:e_commerce/core/view_model/home_view_model.dart';
import 'package:e_commerce/view/components/product_card.dart';
import 'package:e_commerce/view/screens/details/details_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../size_config.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeViewModel>(
      init: Get.find<HomeViewModel>(),
      builder: (controller) => Padding(
        padding: EdgeInsets.all(getProportionateScreenWidth(20)),
        child: GridView.builder(
          itemCount: controller.filteredProductModel!.length,
          itemBuilder: (context, index) => ProductCard(
            product: controller.filteredProductModel![index],
            press: () {
              Get.to(DetailsScreen(index: index));
            },
            onFavPress: () {
              controller.changeFilteredIsFavorite(
                  controller.filteredProductModel![index].id);
            },
          ),
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 200, childAspectRatio: 0.68),
        ),
      ),
    );
  }
}
