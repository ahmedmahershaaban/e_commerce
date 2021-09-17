import 'package:e_commerce/core/view_model/cart_view_model.dart';
import 'package:e_commerce/core/view_model/details_view_model.dart';
import 'package:e_commerce/core/view_model/home_view_model.dart';
import 'package:e_commerce/models/cart_product_model.dart';
import 'package:e_commerce/models/product_model.dart';
import 'package:e_commerce/view/components/default_button.dart';
import 'package:e_commerce/view/screens/cart/cart_screen.dart';
import 'package:e_commerce/view/screens/details/components/product_description.dart';
import 'package:e_commerce/view/screens/details/components/product_images.dart';
import 'package:e_commerce/view/screens/details/components/top_rounded_container.dart';
import 'package:e_commerce/size_config.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'color_dots.dart';

class Body extends StatelessWidget {
  final int index;
  final bool filtered;

  const Body({required this.index, required this.filtered});
  @override
  Widget build(BuildContext context) {
    ProductModel productModel = filtered
        ? Get.find<HomeViewModel>().productModel![index]
        : Get.find<HomeViewModel>().filteredProductModel![index];
    print(productModel.toString());
    return SizedBox(
      width: double.infinity,
      child: SingleChildScrollView(
        child: Column(
          children: [
            ProductImages(
              images: productModel.images,
            ),
            SizedBox(
              height: getProportionateScreenWidth(30),
            ),
            TopRoundedContainer(
              color: Colors.white,
              child: Column(
                children: [
                  ProductDescription(
                    filtered: filtered,
                    index: index,
                  ),
                  TopRoundedContainer(
                    color: Color(0xFFF6F7F9),
                    child: Column(
                      children: [
                        ColorDots(filtered: filtered, index: index),
                        TopRoundedContainer(
                            color: Colors.white,
                            child: Padding(
                              padding: EdgeInsets.only(
                                left: SizeConfig.screenWidth * 0.15,
                                right: SizeConfig.screenWidth * 0.15,
                                top: getProportionateScreenWidth(20),
                                bottom: getProportionateScreenWidth(40),
                              ),
                              child: GetBuilder<CartViewModel>(
                                init: CartViewModel(),
                                builder: (controller1) => DefaultButton(
                                  text: "Add To Chart",
                                  press: () {
                                    CartProductModel cartProductModel =
                                        CartProductModel(
                                      image: productModel.images![0],
                                      title: productModel.title,
                                      price: productModel.price,
                                      id: productModel.id,
                                      color: productModel.colors![
                                          Get.find<DetailsViewModel>()
                                              .selectedColor],
                                      quantity: Get.find<DetailsViewModel>()
                                          .numberOfItems,
                                    );
                                    controller1.addProduct(cartProductModel);
                                    Get.to(CartScreen());
                                  },
                                ),
                              ),
                            )),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
