import 'package:e_commerce/core/view_model/cart_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'components/body.dart';
import 'components/check_out_cart.dart';

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
