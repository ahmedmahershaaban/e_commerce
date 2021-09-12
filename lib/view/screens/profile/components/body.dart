import 'package:e_commerce/core/view_model/profile_view_model.dart';
import 'package:e_commerce/view/screens/profile/components/profile_menu.dart';
import 'package:e_commerce/view/screens/profile/components/profile_pic.dart';
import 'package:e_commerce/size_config.dart';
import 'package:e_commerce/view/screens/sign_in/sign_in_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: GetBuilder<ProfileViewModel>(
        init: ProfileViewModel(),
        builder: (controller) => controller.isLoadingUserModel.value
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Column(
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
                    onPress: () {
                      controller.signOut();
                      Get.offAll(SignInScreen());
                    },
                  ),
                ],
              ),
      ),
    );
  }
}
