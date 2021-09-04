import 'package:e_commerce/core/view_model/home_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:e_commerce/size_config.dart';
import 'package:get/get.dart';

class Categories extends GetWidget<HomeViewModel> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ...List.generate(
            controller.categoryModel.length,
            (index) => CategoriesCard(
              icon: controller.categoryModel[index].image,
              text: controller.categoryModel[index].text,
              press: () {},
            ),
          ),
        ],
      ),
    );
  }
}

/*
 GetBuilder<HomeViewModel>(
          builder: (controller) => ListView.separated(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => CategoriesCard(
                    icon: controller.categoryModel[index].image,
                    text: controller.categoryModel[index].text,
                    press: () {},
                  ),
              separatorBuilder: (context, index) => SizedBox(
                    width: getProportionateScreenWidth(10),
                  ),
              itemCount: controller.categoryModel.length),
        )
 */
class CategoriesCard extends StatelessWidget {
  const CategoriesCard({
    Key? key,
    this.icon,
    this.text,
    this.press,
  }) : super(key: key);

  final String? icon, text;
  final GestureTapCallback? press;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: SizedBox(
        width: getProportionateScreenWidth(55),
        child: Column(
          children: [
            AspectRatio(
              aspectRatio: 1,
              child: Container(
                padding: EdgeInsets.all(getProportionateScreenWidth(15)),
                decoration: BoxDecoration(
                  color: Color(0xFFFFECDF),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: SvgPicture.network(icon!),
              ),
            ),
            SizedBox(height: 5),
            Text(
              text!,
              textAlign: TextAlign.center,
            )
          ],
        ),
      ),
    );
  }
}
