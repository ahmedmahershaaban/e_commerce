import 'package:flutter/material.dart';

import 'package:e_commerce/size_config.dart';

class DiscountBanner extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
      padding: EdgeInsets.symmetric(
        horizontal: getProportionateScreenWidth(20),
        vertical: getProportionateScreenWidth(15),
      ),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Color(0xFF4A3298),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text.rich(
        TextSpan(
          style: TextStyle(color: Colors.white),
          text: "A summer Surprise\n",
          children: [
            TextSpan(
                text: "Cashback 20%",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: getProportionateScreenWidth(24))),
          ],
        ),
      ),
    );
  }
}
