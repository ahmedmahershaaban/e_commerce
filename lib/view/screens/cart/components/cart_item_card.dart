import 'package:e_commerce/constants.dart';
import 'package:e_commerce/models/cart_product_model.dart';
import 'package:e_commerce/size_config.dart';
import 'package:flutter/material.dart';

class CartItemCard extends StatelessWidget {
  const CartItemCard({
    required this.cartProductModel,
  });
  final CartProductModel cartProductModel;
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
                child: Image.network(cartProductModel.image!),
              ),
            ),
          ),
          SizedBox(width: getProportionateScreenWidth(20)),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "${cartProductModel.title}",
                  style: TextStyle(color: Colors.black, fontSize: 16),
                  maxLines: 2,
                ),
                SizedBox(height: 10),
                Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: "\$${cartProductModel.price}",
                        style: TextStyle(color: kPrimaryColor),
                      ),
                      TextSpan(text: "   x${cartProductModel.quantity}"),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
