import 'package:e_commerce/core/view_model/details_view_model.dart';
import 'package:flutter/material.dart';

import 'package:e_commerce/constants.dart';
import 'package:e_commerce/size_config.dart';
import 'package:get/get.dart';

class ProductImages extends StatelessWidget {
  ProductImages({required this.images});
  final List<String>? images;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GetBuilder<DetailsViewModel>(
          init: DetailsViewModel(),
          builder: (controller) => SizedBox(
            width: getProportionateScreenWidth(238),
            child: AspectRatio(
              aspectRatio: 1,
              child: Image.network(images![controller.selectedImage]),
            ),
          ),
        ),
        Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ...List.generate(
                  images!.length,
                  (index) => buildSmallPreview(index),
                )
              ],
            ),
          ),
        )
      ],
    );
  }

  Widget buildSmallPreview(index) {
    return GetBuilder<DetailsViewModel>(
      init: DetailsViewModel(),
      builder: (controller) => GestureDetector(
        onTap: () {
          controller.selectImage(index);
        },
        child: Container(
          margin:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(5)),
          width: getProportionateScreenWidth(48),
          height: getProportionateScreenWidth(48),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
                color: controller.selectedImage == index
                    ? kPrimaryColor
                    : Colors.transparent),
          ),
          child: Image.network(images![index]),
        ),
      ),
    );
  }
}
