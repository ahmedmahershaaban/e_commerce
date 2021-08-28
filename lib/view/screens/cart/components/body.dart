import 'package:e_commerce/models/chart.dart';
import 'package:e_commerce/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'cart_item_card.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
      child: ListView.builder(
          itemCount: demoCart.length,
          itemBuilder: (context, index) => Padding(
                padding: EdgeInsets.symmetric(
                    vertical: getProportionateScreenWidth(10)),
                child: Dismissible(
                  direction: DismissDirection.endToStart,
                  key: Key(demoCart[index].product.id.toString()),
                  onDismissed: (direction) {
                    setState(() {
                      demoCart.removeAt(index);
                    });
                  },
                  background: Container(
                    padding: EdgeInsets.symmetric(
                        horizontal: getProportionateScreenWidth(20)),
                    decoration: BoxDecoration(
                      color: Color(0xFFFFE6E6),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Row(
                      children: [
                        Spacer(),
                        SvgPicture.asset("assets/icons/Trash.svg")
                      ],
                    ),
                  ),
                  child: CartItemCard(
                    cart: demoCart[index],
                  ),
                ),
              )),
    );
  }
}
