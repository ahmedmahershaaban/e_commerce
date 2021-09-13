import 'package:e_commerce/core/view_model/details_view_model.dart';
import 'package:e_commerce/core/view_model/home_view_model.dart';
import 'package:e_commerce/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:e_commerce/constants.dart';
import 'package:e_commerce/size_config.dart';
import 'package:get/get.dart';

class ProductDescription extends StatelessWidget {
  const ProductDescription({
    required this.index,
    required this.filtered,
  });
  final bool filtered;
  final int index;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DetailsViewModel>(
        init: DetailsViewModel(),
        builder: (controller) {
          ProductModel productModel = filtered
              ? Get.find<HomeViewModel>().productModel![index]
              : Get.find<HomeViewModel>().filteredProductModel![index];
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: getProportionateScreenWidth(20)),
                child: Text(
                  "${productModel.title}",
                  style: Theme.of(context).textTheme.headline6,
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: GestureDetector(
                  onTap: () {
                    Get.find<HomeViewModel>()
                        .changeFilteredIsFavorite(productModel.id);
                  },
                  child: GetBuilder<HomeViewModel>(
                    init: Get.find<HomeViewModel>(),
                    builder: (controller) => Container(
                      padding: EdgeInsets.all(getProportionateScreenWidth(15)),
                      width: getProportionateScreenWidth(64),
                      decoration: BoxDecoration(
                        color: productModel.isFavourite
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
                        color: productModel.isFavourite
                            ? Color(0xFFFF4848)
                            : Color(0xFFDBDEE4),
                      ),
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
                      "${productModel.description}",
                      maxLines: controller.maxLines,
                    ),
                    SizedBox(height: getProportionateScreenWidth(5)),
                    controller.maxLines != null
                        ? productModel.description!.length > 130
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
