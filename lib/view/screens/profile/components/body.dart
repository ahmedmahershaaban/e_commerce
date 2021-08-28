import 'package:e_commerce/view/screens/profile/components/profile_menu.dart';
import 'package:e_commerce/view/screens/profile/components/profile_pic.dart';
import 'package:e_commerce/size_config.dart';
import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          ProfilePic(),
          SizedBox(height: getProportionateScreenWidth(20)),
          ProfileMenu(
            text: "My Account",
            icon: "assets/icons/User.svg",
            onPress: () {},
          ),
          ProfileMenu(
            text: "Notifications",
            icon: "assets/icons/Bell.svg",
            onPress: () {},
          ),
          ProfileMenu(
            text: "Settings",
            icon: "assets/icons/Settings.svg",
            onPress: () {},
          ),
          ProfileMenu(
            text: "Help Center",
            icon: "assets/icons/Question mark.svg",
            onPress: () {},
          ),
          ProfileMenu(
            text: "Log Out",
            icon: "assets/icons/Log out.svg",
            onPress: () {},
          ),
        ],
      ),
    );
  }
}
