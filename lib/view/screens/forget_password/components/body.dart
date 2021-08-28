import 'package:e_commerce/view/components/no_account_text.dart';
import 'package:e_commerce/size_config.dart';
import 'package:flutter/material.dart';

import 'package:e_commerce/constants.dart';
import 'foreget_pass_form.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Padding(
      padding:
          EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
      child: SizedBox(
        width: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: SizeConfig.screenHeight * 0.04),
              Text("Forgot Password", style: kHeadLineStyle),
              Text(
                "Please enter your email and we well send \n you a link to return to your account",
                textAlign: TextAlign.center,
              ),
              SizedBox(height: SizeConfig.screenHeight * 0.1),
              ForgetPassForm(),
              SizedBox(height: SizeConfig.screenHeight * 0.1),
              NoAccountText(),
            ],
          ),
        ),
      ),
    ));
  }
}
