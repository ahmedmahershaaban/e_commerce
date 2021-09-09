import 'package:e_commerce/core/view_model/home_view_model.dart';
import 'package:e_commerce/view/components/product_card.dart';
import 'package:e_commerce/view/screens/details/details_screen.dart';
import 'package:e_commerce/view/screens/home/components/section_title.dart';
import 'package:flutter/material.dart';

import 'package:e_commerce/size_config.dart';
import 'package:get/get.dart';

class PopularProduct extends GetWidget<HomeViewModel> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SectionTitle(
          text: "Popular Product",
          press: () {},
        ),
        SizedBox(height: getProportionateScreenWidth(20)),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: GetBuilder<HomeViewModel>(
            init: HomeViewModel(),
            builder: (controller) => controller.isLoadingProduct.value
                ? Center(child: CircularProgressIndicator())
                : Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ...List.generate(
                        controller.productModel!.length,
                        (index) => ProductCard(
                          product: controller.productModel![index],
                          press: () {
                            Get.to(DetailsScreen(
                                productModel: controller.productModel![index]));
                          },
                        ),
                      ),
                      SizedBox(
                        width: getProportionateScreenWidth(20),
                      )
                    ],
                  ),
          ),
        )
      ],
    );
  }
}
// ListView.builder(
//   scrollDirection: Axis.horizontal,
//   itemCount: controller.productModel!.length,
//   itemBuilder: (context, index) => ProductCard(
//     product: controller.productModel![index],
//     press: () {
//       Get.to(
//         DetailsScreen(
//           productDetailsArguments: ProductDetailsArguments(
//               product: controller.productModel![index]),
//         ),
//       );
//     },
//   ),
// ),
