import 'package:e_commerce/models/product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:e_commerce/constants.dart';
import 'package:e_commerce/size_config.dart';

class ProductDescription extends StatelessWidget {
  const ProductDescription({
    Key? key,
    required this.product,
    required this.pressOnMoreDetails,
  }) : super(key: key);

  final Product product;
  final GestureTapCallback pressOnMoreDetails;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: Text(
            product.title,
            style: Theme.of(context).textTheme.headline6,
          ),
        ),
        Align(
          alignment: Alignment.centerRight,
          child: Container(
            padding: EdgeInsets.all(getProportionateScreenWidth(15)),
            width: getProportionateScreenWidth(64),
            decoration: BoxDecoration(
              color: product.isFavourite
                  ? kPrimaryColor.withOpacity(0.15)
                  : kTextColor.withOpacity(0.1),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(getProportionateScreenWidth(20)),
                bottomLeft: Radius.circular(getProportionateScreenWidth(20)),
              ),
            ),
            child: SvgPicture.asset(
              "assets/icons/Heart Icon_2.svg",
              color:
                  product.isFavourite ? Color(0xFFFF4848) : Color(0xFFDBDEE4),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
            left: getProportionateScreenWidth(20),
            right: getProportionateScreenWidth(64),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                product.description,
                maxLines: 3,
              ),
              SizedBox(height: getProportionateScreenWidth(10)),
              GestureDetector(
                onTap: pressOnMoreDetails,
                child: Text(
                  "See More Details  >",
                  style: TextStyle(
                      color: kPrimaryColor, fontWeight: FontWeight.w600),
                ),
              ),
              SizedBox(height: getProportionateScreenWidth(20)),
            ],
          ),
        ),
      ],
    );
  }
}
