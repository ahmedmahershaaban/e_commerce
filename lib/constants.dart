import 'package:e_commerce/size_config.dart';
import 'package:flutter/material.dart';

const kPrimaryColor = Color(0xFFFF7643);
const kPrimaryLightColor = Color(0xFFFFECDF);
const kPrimaryGradientColor = LinearGradient(
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
  colors: [Color(0xFFFFA53E), Color(0xFFFF7643)],
);
const kSecondaryColor = Color(0xFF979797);
const kTextColor = Color(0xFF979797);

const kAnimationDuration = Duration(milliseconds: 200);

final kHeadLineStyle = TextStyle(
  color: Colors.black,
  fontWeight: FontWeight.bold,
  fontSize: getProportionateScreenWidth(28),
);
// Form Error
final RegExp emailValidatorRegExp =
    RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
const String kEmailNullError = "Please Enter your email";
const String kInvalidEmailError = "Please Enter Valid Email";
const String kPassNullError = "Please Enter your password";
const String kConfirmPassNullError = "Please Confirm your password";
const String kShortPassError = "Password is too short";
const String kNameNullError = "Please Enter your name";
const String kPhoneNumberNullError = "Please Enter your phone number";
const String kAddressNullError = "Please Enter your address";

final kOtpInputDecoration = InputDecoration(
  contentPadding: EdgeInsets.symmetric(vertical: 15),
  enabledBorder: outlineInputBorder(),
  border: outlineInputBorder(),
  focusedBorder: outlineInputBorder(),
);

OutlineInputBorder outlineInputBorder() {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(15),
    borderSide: BorderSide(color: kTextColor),
  );
}

//*************************************************************DATABASE Constants **********************************************

const String kTableCartProduct = 'cartProduct';
const String kColumnId = 'id';
const String kColumnTitle = 'title';
const String kColumnImage = 'image';
const String kColumnPrice = 'price';
const String kColumnQuantity = 'quantity';
const String kColumnColor = 'color';
