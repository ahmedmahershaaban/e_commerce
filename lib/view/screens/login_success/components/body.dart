import 'package:e_commerce/view/components/default_button.dart';
import 'package:e_commerce/view/screens/home/home_screen.dart';
import 'package:e_commerce/size_config.dart';
import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        children: [
          SizedBox(height: SizeConfig.screenHeight * 0.04),
          SizedBox(
            width: double.infinity,
            child: Image.asset(
              "assets/images/success.png",
              width: double.infinity,
              // height: SizeConfig.screenHeight * 0.4,
            ),
          ),
          SizedBox(height: SizeConfig.screenHeight * 0.08),
          Text(
            "Login Success",
            style: TextStyle(
                color: Colors.black,
                fontSize: getProportionateScreenWidth(30),
                fontWeight: FontWeight.bold),
          ),
          SizedBox(height: SizeConfig.screenHeight * 0.04),
          Spacer(),
          SizedBox(
            width: SizeConfig.screenWidth * 0.6,
            child: DefaultButton(
              text: "Back to home",
              press: () {
                Navigator.pushNamed(context, HomeScreen.routeName);
              },
            ),
          ),
          Spacer(),
        ],
      ),
    );
  }
}
