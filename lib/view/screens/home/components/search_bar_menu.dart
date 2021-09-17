import 'package:e_commerce/core/view_model/home_view_model.dart';
import 'package:e_commerce/view/screens/details/details_screen.dart';
import 'package:e_commerce/view/screens/home/components/search_bar_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../size_config.dart';

class SearchBarMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeViewModel>(
      init: Get.find<HomeViewModel>(),
      builder: (controller) => Stack(
        fit: StackFit.loose,
        children: [
          Container(
            width: double.infinity,
            height: getProportionateScreenWidth(550),
            child: GestureDetector(
              onTap: () {
                controller.searchBarStatus();
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: getProportionateScreenWidth(20)),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
              ),
              height: 350,
              child: ListView.separated(
                itemCount: controller.filteredProductModel!.length,
                separatorBuilder: (context, index) => SizedBox(
                  height: getProportionateScreenWidth(10),
                ),
                itemBuilder: (context, index) => SearchBarCard(
                  productModel: controller.filteredProductModel![index],
                  press: () {
                    Get.to(DetailsScreen(index: index));
                    controller.searchBarStatus();
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
