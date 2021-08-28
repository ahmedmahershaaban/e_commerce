import 'package:e_commerce/constants.dart';
import 'package:e_commerce/view/screens/complete_profile/components/complete_profile_form.dart';
import 'package:e_commerce/size_config.dart';
import 'package:flutter/material.dart';

class Body extends StatelessWidget {
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
              Text("Complete Profile", style: kHeadLineStyle),
              Text(
                "Complete your details or continue\n with social media",
                textAlign: TextAlign.center,
              ),
              SizedBox(height: SizeConfig.screenHeight * 0.03),
              CompleteProfileForm(),
              SizedBox(height: SizeConfig.screenHeight * 0.03),
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
