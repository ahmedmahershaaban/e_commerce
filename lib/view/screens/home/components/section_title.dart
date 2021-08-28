import 'package:flutter/material.dart';

import 'package:e_commerce/size_config.dart';

class SectionTitle extends StatelessWidget {
  const SectionTitle({
    Key? key,
    this.text,
    this.press,
  }) : super(key: key);

  final String? text;
  final GestureTapCallback? press;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text!,
            style: TextStyle(
              color: Colors.black,
              fontSize: getProportionateScreenWidth(18),
            ),
          ),
          GestureDetector(
            onTap: press,
            child: Text("see More"),
          ),
        ],
      ),
    );
  }
}
