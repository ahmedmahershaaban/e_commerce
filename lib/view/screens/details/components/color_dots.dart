import 'package:e_commerce/core/view_model/details_view_model.dart';
import 'package:e_commerce/core/view_model/home_view_model.dart';
import 'package:e_commerce/models/product_model.dart';
import 'package:e_commerce/view/components/rounded_icon_btn.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce/helper/color_extension.dart';
import 'package:e_commerce/constants.dart';
import 'package:e_commerce/size_config.dart';
import 'package:get/get.dart';

class ColorDots extends StatelessWidget {
  ColorDots({required this.index, required this.filtered});
  final bool filtered;

  final int index;

  @override
  Widget build(BuildContext context) {
    ProductModel productModel = filtered
        ? Get.find<HomeViewModel>().productModel![index]
        : Get.find<HomeViewModel>().filteredProductModel![index];
    return SizedBox(
      height: getProportionateScreenWidth(60),
      child: Padding(
        padding: EdgeInsets.fromLTRB(
          getProportionateScreenWidth(20),
          0,
          getProportionateScreenWidth(20),
          getProportionateScreenWidth(20),
        ),
        child: GetBuilder<DetailsViewModel>(
            init: DetailsViewModel(),
            builder: (controller) {
              return Row(
                children: [
                  Expanded(
                    child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: productModel.colors!.length,
                      itemBuilder: (context, index0) => ColorDot(
                        color: "${productModel.colors![index0]}".toColor(),
                        isSelected:
                            controller.selectedColor == index0 ? true : false,
                        pressOnColor: () {
                          controller.selectColor(index0);
                        },
                      ),
                    ),
                  ),
                  SizedBox(width: getProportionateScreenWidth(15)),
                  RoundedIconBtn(
                      icon: Icons.remove,
                      press: () {
                        controller.decreaseNumberOfItems();
                      }),
                  SizedBox(width: getProportionateScreenWidth(5)),
                  Text(
                    "x${controller.numberOfItems}",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: kPrimaryColor),
                  ),
                  SizedBox(width: getProportionateScreenWidth(5)),
                  RoundedIconBtn(
                      icon: Icons.add,
                      press: () {
                        controller.increaseNumberOfItems();
                      }),
                ],
              );
            }),
      ),
    );
  }
}

class ColorDot extends StatelessWidget {
  const ColorDot({
    required this.color,
    this.isSelected = false,
    required this.pressOnColor,
  });

  final Color color;
  final bool isSelected;
  final GestureTapCallback pressOnColor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: pressOnColor,
      child: Container(
        margin: EdgeInsets.only(right: getProportionateScreenWidth(4)),
        padding: isSelected ? EdgeInsets.all(8) : EdgeInsets.all(0),
        width: getProportionateScreenWidth(40),
        height: getProportionateScreenWidth(40),
        decoration: BoxDecoration(
            border: Border.all(
                color: isSelected ? kPrimaryColor : Colors.transparent),
            shape: BoxShape.circle),
        child: DecoratedBox(
          decoration: BoxDecoration(color: color, shape: BoxShape.circle),
        ),
      ),
    );
  }
}
