import 'package:e_commerce/view/components/default_button.dart';
import 'package:e_commerce/models/product.dart';
import 'package:e_commerce/view/screens/details/components/product_description.dart';
import 'package:e_commerce/view/screens/details/components/product_images.dart';
import 'package:e_commerce/view/screens/details/components/top_rounded_container.dart';
import 'package:e_commerce/size_config.dart';
import 'package:flutter/material.dart';

import 'color_dots.dart';

class Body extends StatelessWidget {
  final Product product;

  const Body({Key? key, required this.product}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: SingleChildScrollView(
        child: Column(
          children: [
            ProductImages(product: product),
            SizedBox(
              height: getProportionateScreenWidth(30),
            ),
            TopRoundedContainer(
              color: Colors.white,
              child: Column(
                children: [
                  ProductDescription(
                    product: product,
                    pressOnMoreDetails: () {},
                  ),
                  TopRoundedContainer(
                    color: Color(0xFFF6F7F9),
                    child: Column(
                      children: [
                        ColorDots(product: product),
                        TopRoundedContainer(
                          color: Colors.white,
                          child: Padding(
                              padding: EdgeInsets.only(
                                left: SizeConfig.screenWidth * 0.15,
                                right: SizeConfig.screenWidth * 0.15,
                                top: getProportionateScreenWidth(20),
                                bottom: getProportionateScreenWidth(40),
                              ),
                              child: DefaultButton(
                                press: () {},
                                text: "Add To Chart",
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
