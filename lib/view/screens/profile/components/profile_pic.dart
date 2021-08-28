import 'package:e_commerce/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ProfilePic extends StatelessWidget {
  const ProfilePic({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: getProportionateScreenWidth(115),
      width:  getProportionateScreenWidth(115),
      child: Stack(
        clipBehavior: Clip.none ,
        fit: StackFit.expand,
        children: [
          CircleAvatar(
              backgroundImage:AssetImage("assets/images/Profile Image.png")
          ),
          Positioned(
            bottom: 0,
            right: -10,
            child: SizedBox(
              height: getProportionateScreenWidth(46),
              width: getProportionateScreenWidth(46),
              child: TextButton(
                onPressed: (){},
                style:TextButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                      side: BorderSide(color: Colors.white)
                  ),
                  backgroundColor: Color(0xFFF5F6F9),

                ),
                child: SvgPicture.asset("assets/icons/Camera Icon.svg"),
              ),
            ),
          )

        ],
      ),
    );
  }
}