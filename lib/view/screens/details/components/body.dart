import 'package:e_commerce/core/view_model/cart_view_model.dart';
import 'package:e_commerce/core/view_model/details_view_model.dart';
import 'package:e_commerce/models/cart_product_model.dart';
import 'package:e_commerce/view/components/default_button.dart';
import 'package:e_commerce/models/product_model.dart';
import 'package:e_commerce/view/screens/details/components/product_description.dart';
import 'package:e_commerce/view/screens/details/components/product_images.dart';
import 'package:e_commerce/view/screens/details/components/top_rounded_container.dart';
import 'package:e_commerce/size_config.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'color_dots.dart';

class Body extends StatelessWidget {
  final ProductModel product;

  const Body({required this.product});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: SingleChildScrollView(
        child: Column(
          children: [
            ProductImages(
              images: product.images,
            ),
            SizedBox(
              height: getProportionateScreenWidth(30),
            ),
            TopRoundedContainer(
              color: Colors.white,
              child: Column(
                children: [
                  ProductDescription(
                    product: product,
                  ),
                  TopRoundedContainer(
                    color: Color(0xFFF6F7F9),
                    child: Column(
                      children: [
                        ColorDots(colors: product.colors),
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
                                builder: (controller1) =>
                                    GetBuilder<DetailsViewModel>(
                                  init: DetailsViewModel(),
                                  builder: (controller2) => DefaultButton(
                                    press: () {
                                      controller1.addProduct(CartProductModel(
                                        image: product.images![0],
                                        title: product.title,
                                        price: product.price,
                                        id: product.id,
                                        color: product
                                            .colors![controller2.selectedColor],
                                        quantity: controller2.numberOfItems,
                                      ));
                                    },
                                    text: "Add To Chart",
                                  ),
                                ),
                              )),
                        ),
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
