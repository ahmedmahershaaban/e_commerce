import 'package:e_commerce/core/view_model/auth_view_model.dart';
import 'package:e_commerce/view/components/social_card.dart';
import 'package:e_commerce/constants.dart';
import 'package:e_commerce/view/screens/sign_up/components/sign_up_form.dart';
import 'package:e_commerce/size_config.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

class Body extends GetWidget<AuthViewModel> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: SizeConfig.screenHeight * 0.03),
              Text("Register Account", style: kHeadLineStyle),
              Text(
                "Complete your details or continue \n with social media",
                textAlign: TextAlign.center,
              ),
              SizedBox(height: SizeConfig.screenHeight * 0.03),
              SignUpForm(),
              SizedBox(height: SizeConfig.screenHeight * 0.03),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SocialCard(
                    icon: "assets/icons/google-icon.svg",
                    press: () {
                      controller.googleSignInMethod();
                    },
                  ),
                  SocialCard(
                    icon: "assets/icons/facebook-2.svg",
                    press: () {
                      controller.facebookSignInMethod();
                    },
                  ),
                  // SocialCard(
                  //   icon: "assets/icons/twitter.svg",
                  //   press: () {},
                  // ),
                ],
              ),
              SizedBox(height: getProportionateScreenWidth(20)),
              Text(
                "By continuing you confirm that you agree \n with our Term and Condition",
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
