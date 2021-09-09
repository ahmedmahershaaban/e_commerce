import 'package:flutter/material.dart';

class RoundedIconBtn extends StatelessWidget {
  const RoundedIconBtn({
    required this.icon,
    required this.press,
  });
  final IconData icon;
  final Function press;
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: press as void Function()?,
      style: TextButton.styleFrom(
        padding: EdgeInsets.zero,
        minimumSize: Size(40, 40),
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
      ),
      child: Icon(
        icon,
      ),
    );
  }
}
