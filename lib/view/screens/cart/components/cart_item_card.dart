import 'package:e_commerce/constants.dart';
import 'package:e_commerce/models/chart.dart';
import 'package:e_commerce/size_config.dart';
import 'package:flutter/material.dart';

class CartItemCard extends StatelessWidget {
  const CartItemCard({
    Key? key,
    required this.cart,
  }) : super(key: key);
  final Cart cart;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          SizedBox(
            width: getProportionateScreenWidth(88),
            child: AspectRatio(
              aspectRatio: 0.88,
              child: Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: Color(0xFFF5F6F9),
                    borderRadius: BorderRadius.circular(15)),
                child: Image.asset(cart.product.images[0]),
              ),
            ),
          ),
          SizedBox(width: getProportionateScreenWidth(20)),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                cart.product.title,
                style: TextStyle(color: Colors.black, fontSize: 16),
                maxLines: 2,
              ),
              SizedBox(height: 10),
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: "\$${cart.product.price}",
                      style: TextStyle(color: kPrimaryColor),
                    ),
                    TextSpan(text: "   x${cart.numberOfItems}"),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
