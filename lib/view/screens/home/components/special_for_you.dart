import 'package:e_commerce/view/screens/home/components/section_title.dart';
import 'package:flutter/material.dart';

import 'package:e_commerce/size_config.dart';

class SpecialForYou extends StatelessWidget {
  const SpecialForYou({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SectionTitle(text: "Special for you", press: () {}),
        SizedBox(height: getProportionateScreenWidth(20)),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              SpecialForYouCard(
                category: "SmartPhones",
                numOfBrands: 18,
                press: () {},
                image: "assets/images/Image Banner 2.png",
              ),
              SpecialForYouCard(
                category: "Fashion",
                numOfBrands: 24,
                press: () {},
                image: "assets/images/Image Banner 3.png",
              ),
              SizedBox(width: getProportionateScreenWidth(20)),
            ],
          ),
        ),
      ],
    );
  }
}

class SpecialForYouCard extends StatelessWidget {
  const SpecialForYouCard({
    Key? key,
    required this.category,
    required this.numOfBrands,
    required this.press,
    required this.image,
  }) : super(key: key);
  final String category, image;
  final int numOfBrands;

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
                    Image.asset(
                      image,
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
