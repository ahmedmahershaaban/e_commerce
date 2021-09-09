import 'package:flutter/material.dart';

import 'package:e_commerce/constants.dart';
import 'package:e_commerce/size_config.dart';

class SearchField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 60,
      width: SizeConfig.screenWidth * 0.6, //60% of width
      decoration: BoxDecoration(
        color: kTextColor.withOpacity(0.1),
        borderRadius: BorderRadius.circular(15),
      ),
      child: TextField(
        onChanged: (value) {
          // value
        },
        decoration: InputDecoration(
          hintText: "Search Product",
          border: InputBorder.none,
          focusedBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(
            horizontal: getProportionateScreenWidth(20),
            vertical: getProportionateScreenHeight(9),
          ),
          prefixIcon: Icon(Icons.search),
        ),
      ),
    );
  }
}
