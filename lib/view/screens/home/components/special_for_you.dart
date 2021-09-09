import 'package:e_commerce/core/view_model/home_view_model.dart';
import 'package:e_commerce/view/screens/home/components/section_title.dart';
import 'package:flutter/material.dart';

import 'package:e_commerce/size_config.dart';
import 'package:get/get.dart';

class SpecialForYou extends GetWidget<HomeViewModel> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SectionTitle(text: "Special for you", press: () {}),
        SizedBox(height: getProportionateScreenWidth(20)),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: GetBuilder<HomeViewModel>(
            init: HomeViewModel(),
            builder: (controller) => controller.isLoadingBanner.value
                ? Center(child: CircularProgressIndicator())
                : Row(
                    children: [
                      ...List.generate(
                        controller.bannerModel!.length,
                        (index) => SpecialForYouCard(
                          category: controller.bannerModel![index].title,
                          numOfBrands:
                              controller.bannerModel![index].numOfBrands,
                          press: () {},
                          image: "${controller.bannerModel![index].image}",
                        ),
                      ),
                      SizedBox(width: getProportionateScreenWidth(20)),
                    ],
                  ),
          ),
        )
        // Row(
        //   children: [
        //     ListView.builder(
        //       scrollDirection: Axis.horizontal,
        //       itemCount: controller.bannerModel!.length,
        //       itemBuilder: (context, index) => SpecialForYouCard(
        //         category: controller.bannerModel![index].title,
        //         numOfBrands: controller.bannerModel![index].numOfBrands,
        //         press: () {},
        //         image: "${controller.bannerModel![index].image}",
        //       ),
        //     ),
        //   ],
        // ),
      ],
    );
  }
}

class SpecialForYouCard extends StatelessWidget {
  const SpecialForYouCard({
    required this.category,
    required this.numOfBrands,
    required this.press,
    required this.image,
  });
  final String? category, image;
  final int? numOfBrands;

  final GestureTapCallback press;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: getProportionateScreenWidth(20)),
      child: GestureDetector(
        onTap: press,
        child: Stack(
          children: [
            SizedBox(
              width: getProportionateScreenWidth(242),
              height: getProportionateScreenWidth(100),
              child: ClipRRect(
                borderRadius:
                    BorderRadius.circular(getProportionateScreenWidth(20)),
                child: Stack(
                  children: [
                    Image.network(
                      "$image",
                      fit: BoxFit.cover,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Color(0xFF343434).withOpacity(0.40),
                            Color(0xFF343434).withOpacity(0.15),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: getProportionateScreenWidth(20),
                  vertical: getProportionateScreenWidth(15)),
              child: Text.rich(
                TextSpan(
                  style: TextStyle(
                    color: Colors.white,
                  ),
                  children: [
                    TextSpan(
                      text: "$category\n",
                      style: TextStyle(
                        fontSize: getProportionateScreenWidth(18),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextSpan(text: "$numOfBrands Brands"),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
