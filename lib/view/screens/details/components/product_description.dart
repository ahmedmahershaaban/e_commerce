import 'package:e_commerce/core/view_model/details_view_model.dart';
import 'package:e_commerce/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:e_commerce/constants.dart';
import 'package:e_commerce/size_config.dart';
import 'package:get/get.dart';

class ProductDescription extends StatelessWidget {
  const ProductDescription({
    required this.product,
  });

  final ProductModel? product;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DetailsViewModel>(
        init: DetailsViewModel(),
        builder: (controller) {
          controller.selectIsFavourite(product!.isFavourite);
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: getProportionateScreenWidth(20)),
                child: Text(
                  "${product!.title}",
                  style: Theme.of(context).textTheme.headline6,
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: GestureDetector(
                  onTap: () {
                    controller.changeIsFavourite();
                  },
                  child: Container(
                    padding: EdgeInsets.all(getProportionateScreenWidth(15)),
                    width: getProportionateScreenWidth(64),
                    decoration: BoxDecoration(
                      color: controller.isFavourite.value
                          ? kPrimaryColor.withOpacity(0.15)
                          : kTextColor.withOpacity(0.1),
                      borderRadius: BorderRadius.only(
                        topLeft:
                            Radius.circular(getProportionateScreenWidth(20)),
                        bottomLeft:
                            Radius.circular(getProportionateScreenWidth(20)),
                      ),
                    ),
                    child: SvgPicture.asset(
                      "assets/icons/Heart Icon_2.svg",
                      color: controller.isFavourite.value
                          ? Color(0xFFFF4848)
                          : Color(0xFFDBDEE4),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: getProportionateScreenWidth(20),
                  right: getProportionateScreenWidth(64),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "${product!.description}",
                      maxLines: controller.maxLines,
                    ),
                    SizedBox(height: getProportionateScreenWidth(5)),
                    controller.maxLines != null
                        ? product!.description!.length > 130
                            ? GestureDetector(
                                onTap: controller.seeMoreDetailsClicked,
                                child: Text(
                                  "See More Details  >",
                                  style: TextStyle(
                                      color: kPrimaryColor,
                                      fontWeight: FontWeight.w600),
                                ),
                              )
                            : SizedBox(height: getProportionateScreenWidth(20))
                        : SizedBox(height: getProportionateScreenWidth(20)),
                    SizedBox(height: getProportionateScreenWidth(20)),
                  ],
                ),
              ),
            ],
          );
        });
  }
}
