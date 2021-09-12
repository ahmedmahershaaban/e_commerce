import 'package:e_commerce/size_config.dart';
import 'package:flutter/material.dart';

class EmptyCart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset("assets/images/empty_cart.png"),
          Text(
            "Your Cart Is Empty",
            style: TextStyle(
                color: Colors.black, fontSize: getProportionateScreenWidth(20)),
          ),
        ],
      ),
    );
  }
}
