import 'package:e_commerce/core/view_model/profile_view_model.dart';
import 'package:e_commerce/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class ProfilePic extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileViewModel>(
      init: ProfileViewModel(),
      builder: (controller) => SizedBox(
        height: getProportionateScreenWidth(115),
        width: getProportionateScreenWidth(115),
        child: Stack(
          clipBehavior: Clip.none,
          fit: StackFit.expand,
          children: [
            CircleAvatar(
              child: ClipOval(
                child: (controller.userModel == null ||
                        controller.userModel!.pic == 'default')
                    ? Image.asset("assets/images/Profile Image.png")
                    : Image.network('${controller.userModel!.pic!}'),
              ),
              // backgroundImage:  AssetImage("assets/images/Profile Image.png") : NetworkImage('${controller.userModel!.pic!}')
              // backgroundImage: (controller.userModel == null ||
              //         controller.userModel!.pic == 'default')
              //     ? AssetImage("assets/images/Profile Image.png")
              //     : AssetImage("assets/images/Profile Image.png"),
              // : NetworkImage('${controller.userModel!.pic!}'),
            ),
            Positioned(
              bottom: 0,
              right: -10,
              child: SizedBox(
                height: getProportionateScreenWidth(46),
                width: getProportionateScreenWidth(46),
                child: TextButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                        side: BorderSide(color: Colors.white)),
                    backgroundColor: Color(0xFFF5F6F9),
                  ),
                  child: SvgPicture.asset("assets/icons/Camera Icon.svg"),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
