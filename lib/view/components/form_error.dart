import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:e_commerce/size_config.dart';

class FormError extends StatelessWidget {
  const FormError({
    required this.errors,
  });

  final List<String> errors;

  @override
  Widget build(BuildContext context) {
    return Column(
        children: List.generate(
      errors.length,
      (index) => formErrorText(error: errors[index]),
    ));
  }

  Row formErrorText({required String error}) {
    return Row(
      children: [
        SvgPicture.asset(
          "assets/icons/Error.svg",
          height: getProportionateScreenHeight(14),
          width: getProportionateScreenWidth(14),
        ),
        SizedBox(width: getProportionateScreenWidth(10)),
        Text(error)
      ],
    );
  }
}
