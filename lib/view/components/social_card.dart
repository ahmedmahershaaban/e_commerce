import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:e_commerce/size_config.dart';

class SocialCard extends StatelessWidget {
  const SocialCard({
    this.icon,
    this.press,
  });
  final String? icon;
  final Function? press;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press as void Function()?,
      child: Container(
        margin:
            EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(5)),
        padding: EdgeInsets.all(getProportionateScreenWidth(7)),
        height: getProportionateScreenHeight(40),
        width: getProportionateScreenWidth(40),
        decoration:
            BoxDecoration(color: Color(0xFFF5F6F9), shape: BoxShape.circle),
        child: SvgPicture.asset(icon!),
      ),
    );
  }
}
