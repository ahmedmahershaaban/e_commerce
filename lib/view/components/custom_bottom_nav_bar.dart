import 'package:e_commerce/core/view_model/control_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:e_commerce/constants.dart';
import 'package:get/get.dart';

class CustomBottomNavBar extends GetWidget<ControlViewModel> {
  @override
  Widget build(BuildContext context) {
    Color inActiveIconColor = Color(0xFFB6B6B6);

    return GetBuilder<ControlViewModel>(
      init: ControlViewModel(),
      builder: (controller) => Container(
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
                controller.changeSelectedValue(0);
              },
              icon: SvgPicture.asset(
                "assets/icons/Shop Icon.svg",
                color: controller.navigatorValue == 0
                    ? kPrimaryColor
                    : inActiveIconColor,
              ),
            ),
            IconButton(
              onPressed: () {
                controller.changeSelectedValue(1);
              },
              icon: SvgPicture.asset(
                "assets/icons/Heart Icon.svg",
                color: controller.navigatorValue == 1
                    ? kPrimaryColor
                    : inActiveIconColor,
              ),
            ),
            IconButton(
              onPressed: () {
                controller.changeSelectedValue(2);
              },
              icon: SvgPicture.asset(
                "assets/icons/Chat bubble Icon.svg",
                color: controller.navigatorValue == 2
                    ? kPrimaryColor
                    : inActiveIconColor,
              ),
            ),
            IconButton(
              onPressed: () {
                controller.changeSelectedValue(3);
              },
              icon: SvgPicture.asset(
                "assets/icons/User Icon.svg",
                color: controller.navigatorValue == 3
                    ? kPrimaryColor
                    : inActiveIconColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
