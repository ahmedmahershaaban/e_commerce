import 'package:e_commerce/size_config.dart';
import 'package:flutter/material.dart';

class EmptyNotification extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset("assets/images/empty_notification.png"),
          Text(
            "You don't have new notifications",
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Colors.black, fontSize: getProportionateScreenWidth(18)),
          ),
        ],
      ),
    );
  }
}
