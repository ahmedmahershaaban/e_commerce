import 'package:e_commerce/core/view_model/cart_view_model.dart';
import 'package:e_commerce/view/components/default_button.dart';
import 'package:e_commerce/constants.dart';
import 'package:e_commerce/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import 'components/body.dart';

class CartScreen extends StatelessWidget {
  static const routeName = "/cart";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: Body(),
      bottomNavigationBar: CheckOurCart(),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      centerTitle: true,
      title: Column(
        children: [
          Text(
            "Your Cart",
            style: TextStyle(color: Colors.black),
          ),
          GetBuilder<CartViewModel>(
            init: CartViewModel(),
            builder: (controller) => Text(
              "${controller.cartProductModel.length} items",
              style: Theme.of(context).textTheme.caption,
            ),
          )
        ],
      ),
    );
  }
}

class CheckOurCart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(
            horizontal: getProportionateScreenWidth(30),
            vertical: getProportionateScreenWidth(15)),
        // height: 174,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(getProportionateScreenWidth(30)),
            topRight: Radius.circular(getProportionateScreenWidth(30)),
          ),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              offset: Offset(0, -15),
              blurRadius: 20,
              color: Color(0xFFDADADA).withOpacity(0.15),
            ),
          ],
        ),
        child: SafeArea(
          child: GetBuilder<CartViewModel>(
            init: CartViewModel(),
            builder: (controller) => Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    Container(
                      padding: EdgeInsets.all(10),
                      width: getProportionateScreenWidth(40),
                      height: getProportionateScreenWidth(40),
                      decoration: BoxDecoration(
                        color: Color(0xFFF5F6F9),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: SvgPicture.asset("assets/icons/receipt.svg"),
                    ),
                    Spacer(),
                    Text("Add voucher code"),
                    SizedBox(width: 7),
                    Icon(
                      Icons.arrow_forward_ios,
                      size: 12,
                      color: kTextColor,
                    )
                  ],
                ),
                SizedBox(height: getProportionateScreenWidth(20)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text.rich(
                      TextSpan(
                        text: "Total:\n",
                        children: [
                          TextSpan(
                              text: "\$${controller.totalPrice}",
                              style:
                                  TextStyle(fontSize: 16, color: Colors.black))
                        ],
                      ),
                    ),
                    SizedBox(
                      width: SizeConfig.screenWidth * 0.5,
                      child: DefaultButton(
                        text: "Check Out",
                        press: () {},
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ));
  }
}
