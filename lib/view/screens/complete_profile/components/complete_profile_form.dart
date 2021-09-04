import 'package:e_commerce/view/components/custom_suffix_icon.dart';
import 'package:e_commerce/view/components/default_button.dart';
import 'package:e_commerce/view/components/form_error.dart';
import 'package:e_commerce/view/screens/otp/otp_screen.dart';
import 'package:flutter/material.dart';

import 'package:e_commerce/constants.dart';
import 'package:e_commerce/size_config.dart';
import 'package:get/get.dart';

class CompleteProfileForm extends StatefulWidget {
  @override
  _CompleteProfileFormState createState() => _CompleteProfileFormState();
}

class _CompleteProfileFormState extends State<CompleteProfileForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String? firstName;
  String? lastName;
  String? phoneNumber;
  String? address;
  final List<String> errors = [];
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          buildFirstNameFormField(),
          SizedBox(height: getProportionateScreenWidth(20)),
          buildLastNameFormField(),
          SizedBox(height: getProportionateScreenWidth(20)),
          buildPhoneNumberFormField(),
          SizedBox(height: getProportionateScreenWidth(20)),
          buildAddressFormField(),
          SizedBox(height: getProportionateScreenWidth(10)),
          FormError(errors: errors),
          SizedBox(height: getProportionateScreenWidth(10)),
          DefaultButton(
            text: "Continue",
            press: () {
              _formKey.currentState!.save();
              if (_formKey.currentState!.validate()) {
                // move to complete profile screen
                Get.to(OtpScreen());
              }
            },
          ),
        ],
      ),
    );
  }

  TextFormField buildAddressFormField() {
    return TextFormField(
      onSaved: (value) => address = value,
      onChanged: (value) {
        if (value.isNotEmpty && errors.contains(kAddressNullError)) {
          removeError(kAddressNullError);
        }
        return null;
      },
      validator: (value) {
        if (value!.isEmpty && !errors.contains(kAddressNullError)) {
          addError(kAddressNullError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Address",
        hintText: "Enter your address ",
        suffixIcon:
            CustomSuffixIcon(svgIcon: "assets/icons/Location point.svg"),
      ),
    );
  }

  TextFormField buildPhoneNumberFormField() {
    return TextFormField(
      keyboardType: TextInputType.number,
      onSaved: (value) => phoneNumber = value,
      onChanged: (value) {
        if (value.isNotEmpty && errors.contains(kPhoneNumberNullError)) {
          removeError(kPhoneNumberNullError);
        }
        return null;
      },
      validator: (value) {
        if (value!.isEmpty && !errors.contains(kPhoneNumberNullError)) {
          addError(kPhoneNumberNullError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Phone Number",
        hintText: "Enter your phone number",
        suffixIcon: CustomSuffixIcon(svgIcon: "assets/icons/Phone.svg"),
      ),
    );
  }

  TextFormField buildLastNameFormField() {
    return TextFormField(
      onSaved: (value) => lastName = value,
      decoration: InputDecoration(
          labelText: "Last Name",
          hintText: "Enter your last name",
          suffixIcon: CustomSuffixIcon(svgIcon: "assets/icons/User.svg")),
    );
  }

  TextFormField buildFirstNameFormField() {
    return TextFormField(
      onSaved: (value) => firstName = value,
      onChanged: (value) {
        if (value.isNotEmpty && errors.contains(kNameNullError)) {
          removeError(kNameNullError);
        }
        return null;
      },
      validator: (value) {
        if (value!.isEmpty && !errors.contains(kNameNullError)) {
          addError(kNameNullError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
          labelText: "First Name",
          hintText: "Enter your first name",
          suffixIcon: CustomSuffixIcon(svgIcon: "assets/icons/User.svg")),
    );
  }

  void addError(String errorName) {
    return setState(() {
      errors.add(errorName);
    });
  }

  void removeError(String errorName) {
    return setState(() {
      errors.remove(errorName);
    });
  }
}
