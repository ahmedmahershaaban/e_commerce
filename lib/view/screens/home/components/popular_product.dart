import 'package:e_commerce/view/components/product_card.dart';
import 'package:e_commerce/models/product.dart';
import 'package:e_commerce/view/screens/details/details_screen.dart';
import 'package:e_commerce/view/screens/home/components/section_title.dart';
import 'package:flutter/material.dart';

import 'package:e_commerce/size_config.dart';

class PopularProduct extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SectionTitle(
          text: "Popular Product",
          press: () {},
        ),
        SizedBox(height: getProportionateScreenWidth(20)),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ...List.generate(
                demoProducts.length,
                (index) => ProductCard(
                  product: demoProducts[index],
                  press: () {
                    Navigator.pushNamed(context, DetailsScreen.routeName,
                        arguments: ProductDetailsArguments(
                            product: demoProducts[index]));
                  },
                ),
              ),
              SizedBox(
                width: getProportionateScreenWidth(20),
              )
            ],
          ),
        )
      ],
    );
  }
}
