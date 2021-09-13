import 'package:e_commerce/core/view_model/home_view_model.dart';
import 'package:e_commerce/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:e_commerce/constants.dart';
import 'package:e_commerce/size_config.dart';
import 'package:get/get.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    this.width = 140,
    this.aspectRatio = 1.02,
    required this.product,
    required this.press,
    required this.onFavPress,
  });
  final double width, aspectRatio;
  final ProductModel? product;
  final GestureTapCallback press;
  final GestureTapCallback onFavPress;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeViewModel>(
        init: Get.find<HomeViewModel>(),
        builder: (controller) {
          return Padding(
            padding: EdgeInsets.only(left: getProportionateScreenWidth(20)),
            child: GestureDetector(
              onTap: press,
              child: SizedBox(
                width: getProportionateScreenWidth(width),
                child: Stack(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AspectRatio(
                          aspectRatio: aspectRatio,
                          child: Container(
                            padding:
                                EdgeInsets.all(getProportionateScreenWidth(20)),
                            decoration: BoxDecoration(
                              color: kTextColor.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Image.network(product!.images![0]),
                          ),
                        ),
                        SizedBox(height: getProportionateScreenWidth(7)),
                        Text(
                          "${product!.title}",
                          style: TextStyle(color: Colors.black),
                          maxLines: 2,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "\$${product!.price}",
                              style: TextStyle(
                                color: kPrimaryColor,
                                fontWeight: FontWeight.w600,
                                fontSize: getProportionateScreenWidth(18),
                              ),
                            ),
                            InkWell(
                              onTap: onFavPress,
                              borderRadius: BorderRadius.circular(50),
                              child: Container(
                                padding: EdgeInsets.all(
                                    getProportionateScreenWidth(8)),
                                width: getProportionateScreenWidth(28),
                                height: getProportionateScreenWidth(28),
                                decoration: BoxDecoration(
                                    color: product!.isFavourite
                                        ? kPrimaryColor.withOpacity(0.15)
                                        : kTextColor.withOpacity(0.1),
                                    shape: BoxShape.circle),
                                child: SvgPicture.asset(
                                  "assets/icons/Heart Icon_2.svg",
                                  color: product!.isFavourite
                                      ? Color(0xFFFF4848)
                                      : Color(0xFFDBDEE4),
                                ),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
