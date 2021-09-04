import 'package:e_commerce/core/view_model/auth_view_model.dart';
import 'package:e_commerce/view/components/custom_suffix_icon.dart';
import 'package:e_commerce/view/components/default_button.dart';
import 'package:e_commerce/view/components/form_error.dart';
import 'package:flutter/material.dart';

import 'package:e_commerce/constants.dart';

import 'package:e_commerce/size_config.dart';
import 'package:get/get.dart';

class SignUpForm extends GetWidget<AuthViewModel> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          buildNameFormField(),
          SizedBox(height: getProportionateScreenWidth(20)),
          buildEmailFormField(),
          SizedBox(height: getProportionateScreenWidth(20)),
          buildPasswordFormField(),
          SizedBox(height: getProportionateScreenWidth(15)),
          FormError(errors: controller.errors),
          SizedBox(height: getProportionateScreenWidth(15)),
          DefaultButton(
            text: "Continue",
            press: () {
              _formKey.currentState!.save();
              if (_formKey.currentState!.validate()) {
                // move to complete profile screen
                controller.createUserWithEmailAndPassword();
              }
            },
          ),
        ],
      ),
    );
  }

  TextFormField buildEmailFormField() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      onSaved: (newValue) => controller.email = newValue,
      onChanged: (value) {
        if (value.isNotEmpty && controller.errors.contains(kEmailNullError)) {
          removeError(kEmailNullError);
        } else if (emailValidatorRegExp.hasMatch(value) &&
            controller.errors.contains(kInvalidEmailError)) {
          removeError(kInvalidEmailError);
        }
        return null;
      },
      validator: (value) {
        if (value!.isEmpty && !controller.errors.contains(kEmailNullError)) {
          addError(kEmailNullError);
          return "";
        } else if (!emailValidatorRegExp.hasMatch(value) &&
            !controller.errors.contains(kInvalidEmailError) &&
            !controller.errors.contains(kEmailNullError)) {
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
        if (value.isNotEmpty && controller.errors.contains(kPassNullError)) {
          removeError(kPassNullError);
        } else if (value.length >= 8 &&
            controller.errors.contains(kShortPassError)) {
          removeError(kShortPassError);
        }
        return null;
      },
      validator: (value) {
        if (value!.isEmpty && !controller.errors.contains(kPassNullError)) {
          addError(kPassNullError);
          return "";
        } else if (value.length < 8 &&
            !controller.errors.contains(kShortPassError) &&
            !controller.errors.contains(kPassNullError)) {
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

  TextFormField buildNameFormField() {
    return TextFormField(
      onSaved: (newValue) => controller.name = newValue,
      onChanged: (value) {
        if (value.isNotEmpty && controller.errors.contains(kNameNullError)) {
          removeError(kNameNullError);
        }
        return null;
      },
      validator: (value) {
        if (value!.isEmpty && !controller.errors.contains(kNameNullError)) {
          addError(kNameNullError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Name",
        hintText: "Enter Your Name",
        suffixIcon: CustomSuffixIcon(svgIcon: "assets/icons/User.svg"),
      ),
    );
  }

  void addError(String errorName) {
    controller.errors.add(errorName);
  }

  void removeError(String errorName) {
    controller.errors.remove(errorName);
  }
}
