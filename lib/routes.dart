import 'package:e_commerce/view/screens/cart/cart_screen.dart';
import 'package:e_commerce/view/screens/complete_profile/complete_profile_screen.dart';
import 'package:e_commerce/view/screens/forget_password/forget_password_screen.dart';
import 'package:e_commerce/view/screens/home/home_screen.dart';
import 'package:e_commerce/view/screens/login_success/login_success_screen.dart';
import 'package:e_commerce/view/screens/otp/otp_screen.dart';
import 'package:e_commerce/view/screens/profile/profile_screen.dart';
import 'package:e_commerce/view/screens/sign_in/sign_in_screen.dart';
import 'package:e_commerce/view/screens/sign_up/sign_up_screen.dart';
import 'package:e_commerce/view/screens/splash/splash_screen.dart';
import 'package:flutter/material.dart';

final Map<String, WidgetBuilder> routes = {
  SplashScreen.routeName: (context) => SplashScreen(),
  SignInScreen.routeName: (context) => SignInScreen(),
  ForgetPasswordScreen.routeName: (context) => ForgetPasswordScreen(),
  LoginSuccessScreen.routeName: (context) => LoginSuccessScreen(),
  SignUpScreen.routeName: (context) => SignUpScreen(),
  CompleteProfileScreen.routeName: (context) => CompleteProfileScreen(),
  OtpScreen.routeName: (context) => OtpScreen(),
  HomeScreen.routeName: (context) => HomeScreen(),
  // DetailsScreen.routeName: (context) => DetailsScreen(),
  CartScreen.routeName: (context) => CartScreen(),
  ProfileScreen.routeName: (context) => ProfileScreen(),
};
