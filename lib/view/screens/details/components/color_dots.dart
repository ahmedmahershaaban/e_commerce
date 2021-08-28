import 'package:e_commerce/view/components/rounded_icon_btn.dart';
import 'package:e_commerce/models/product.dart';
import 'package:flutter/material.dart';

import 'package:e_commerce/constants.dart';
import 'package:e_commerce/size_config.dart';

class ColorDots extends StatefulWidget {
  const ColorDots({
    Key? key,
    required this.product,
  }) : super(key: key);

  final Product product;

  @override
  _ColorDotsState createState() => _ColorDotsState();
}

class _ColorDotsState extends State<ColorDots> {
  int selectedColor = 0;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(getProportionateScreenWidth(20), 0,
          getProportionateScreenWidth(20), getProportionateScreenWidth(20)),
      child: Row(
        children: [
          ...List.generate(
            widget.product.colors.length,
            (index) => ColorDot(
              color: widget.product.colors[index],
              isSelected: selectedColor == index ? true : false,
              pressOnColor: () {
                setState(() {
                  selectedColor = index;
                });
              },
            ),
          ),
          Spacer(),
          RoundedIconBtn(icon: Icons.remove, press: () {}),
          SizedBox(width: getProportionateScreenWidth(10)),
          RoundedIconBtn(icon: Icons.add, press: () {}),
        ],
      ),
    );
  }
}

class ColorDot extends StatelessWidget {
  const ColorDot({
    Key? key,
    required this.color,
    this.isSelected = false,
    required this.pressOnColor,
  }) : super(key: key);

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
