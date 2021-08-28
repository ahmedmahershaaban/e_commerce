import 'package:e_commerce/enums.dart';
import 'package:e_commerce/view/screens/home/home_screen.dart';
import 'package:e_commerce/view/screens/profile/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:e_commerce/constants.dart';

class CustomBottomNavBar extends StatelessWidget {
  final MenuState selectedMenu;

  const CustomBottomNavBar({
    required this.selectedMenu,
  });

  @override
  Widget build(BuildContext context) {
    Color inActiveIconColor = Color(0xFFB6B6B6);

    return Container(
      padding: EdgeInsets.symmetric(vertical: 14),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(40),
            topRight: Radius.circular(40),
          ),
          boxShadow: [
            BoxShadow(
              color: Color(0xFFDADADA).withOpacity(0.15),
              blurRadius: 20,
              offset: Offset(0, -15),
            )
          ]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, HomeScreen.routeName);
            },
            icon: SvgPicture.asset(
              "assets/icons/Shop Icon.svg",
              color: selectedMenu == MenuState.home
                  ? kPrimaryColor
                  : inActiveIconColor,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset(
              "assets/icons/Heart Icon.svg",
              color: selectedMenu == MenuState.favourite
                  ? kPrimaryColor
                  : inActiveIconColor,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset(
              "assets/icons/Chat bubble Icon.svg",
              color: selectedMenu == MenuState.message
                  ? kPrimaryColor
                  : inActiveIconColor,
            ),
          ),
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, ProfileScreen.routeName);
            },
            icon: SvgPicture.asset(
              "assets/icons/User Icon.svg",
              color: selectedMenu == MenuState.profile
                  ? kPrimaryColor
                  : inActiveIconColor,
            ),
          ),
        ],
      ),
    );
  }
}
