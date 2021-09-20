import 'package:e_commerce/core/view_model/auth_view_model.dart';
import 'package:e_commerce/core/view_model/sign_in_view_model.dart';
import 'package:e_commerce/view/components/custom_suffix_icon.dart';
import 'package:e_commerce/view/components/default_button.dart';
import 'package:e_commerce/view/components/form_error.dart';
import 'package:e_commerce/view/screens/forget_password/forget_password_screen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:e_commerce/constants.dart';
import 'package:e_commerce/size_config.dart';
import 'package:get/get.dart';

class SignForm extends GetWidget<AuthViewModel> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthViewModel>(
      init: AuthViewModel(),
      builder: (controller) => Form(
          key: _formKey,
          child: Column(
            children: [
              buildEmailFormField(),
              SizedBox(height: getProportionateScreenHeight(30)),
              buildPasswordFormField(),
              SizedBox(height: getProportionateScreenHeight(30)),
              Row(
                children: [
                  GetBuilder<SignInViewModel>(
                    init: SignInViewModel(),
                    builder: (controller0) => Checkbox(
                      value: controller0.rememberMe.value,
                      activeColor: kPrimaryColor,
                      onChanged: (value) {
                        controller0.changeRememberMe(value!);
                      },
                    ),
                  ),
                  Text("Remember Me"),
                  Spacer(),
                  GestureDetector(
                    onTap: () {
                      Get.to(ForgetPasswordScreen());
                    },
                    child: Text(
                      "Forget Password",
                      style: TextStyle(decoration: TextDecoration.underline),
                    ),
                  )
                ],
              ),
              SizedBox(height: getProportionateScreenHeight(20)),
              GetBuilder<SignInViewModel>(
                  init: SignInViewModel(),
                  builder: (controller) =>
                      FormError(errors: Get.find<SignInViewModel>().errors)),
              SizedBox(height: SizeConfig.screenHeight * 0.04),
              DefaultButton(
                text: "Continue",
                press: () {
                  _formKey.currentState!.save();
                  if (_formKey.currentState!.validate()) {
                    // if every thing is ok just go to success screen
                    controller.signInWithEmailAndPassword();
                  }
                },
              )
            ],
          )),
    );
  }

  TextFormField buildEmailFormField() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      onSaved: (newValue) => controller.email = newValue,
      onChanged: (value) {
        if (value.isNotEmpty &&
            Get.find<SignInViewModel>().errors.contains(kEmailNullError)) {
          removeError(kEmailNullError);
        } else if (emailValidatorRegExp.hasMatch(value) &&
            Get.find<SignInViewModel>().errors.contains(kInvalidEmailError)) {
          removeError(kInvalidEmailError);
        }
        return null;
      },
      validator: (value) {
        if (value!.isEmpty &&
            !Get.find<SignInViewModel>().errors.contains(kEmailNullError)) {
          addError(kEmailNullError);
          return "";
        } else if (!emailValidatorRegExp.hasMatch(value) &&
            !Get.find<SignInViewModel>().errors.contains(kInvalidEmailError) &&
            !Get.find<SignInViewModel>().errors.contains(kEmailNullError)) {
          addError(kInvalidEmailError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Email",
        hintText: "Enter Your Email",
        suffixIcon: CustomSuffixIcon(svgIcon: "assets/icons/Mail.svg"),
      ),
    );
  }

  TextFormField buildPasswordFormField() {
    return TextFormField(
      obscureText: true,
      onSaved: (newValue) => controller.password = newValue,
      onChanged: (value) {
        if (value.isNotEmpty &&
            Get.find<SignInViewModel>().errors.contains(kPassNullError)) {
          removeError(kPassNullError);
        } else if (value.length >= 8 &&
            Get.find<SignInViewModel>().errors.contains(kShortPassError)) {
          removeError(kShortPassError);
        }
        return null;
      },
      validator: (value) {
        if (value!.isEmpty &&
            !Get.find<SignInViewModel>().errors.contains(kPassNullError)) {
          addError(kPassNullError);

          return "";
        } else if (value.length < 8 &&
            !Get.find<SignInViewModel>().errors.contains(kShortPassError) &&
            !Get.find<SignInViewModel>().errors.contains(kPassNullError)) {
          addError(kShortPassError);

          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Password",
        hintText: "Enter Your Password",
        suffixIcon: CustomSuffixIcon(svgIcon: "assets/icons/Lock.svg"),
      ),
    );
  }

  void addError(String errorName) {
    Get.find<SignInViewModel>().addError(errorName);
  }

  void removeError(String errorName) {
    Get.find<SignInViewModel>().removeError(errorName);
  }
}
