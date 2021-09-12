import 'package:e_commerce/core/view_model/cart_view_model.dart';
import 'package:e_commerce/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import 'cart_item_card.dart';
import 'empty_cart.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<CartViewModel>(
      init: CartViewModel(),
      builder: (controller) => controller.cartProductModel.length == 0
          ? EmptyCart()
          : Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: getProportionateScreenWidth(20)),
              child: ListView.builder(
                  itemCount: controller.cartProductModel.length,
                  itemBuilder: (context, index) => Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: getProportionateScreenWidth(10)),
                        child: Dismissible(
                          direction: DismissDirection.endToStart,
                          key: Key(
                              controller.cartProductModel[index].id.toString()),
                          onDismissed: (direction) {
                            controller.deleteProduct(
                                controller.cartProductModel[index].id!);
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
                            cartProductModel:
                                controller.cartProductModel[index],
                          ),
                        ),
                      )),
            ),
    );
  }
}
