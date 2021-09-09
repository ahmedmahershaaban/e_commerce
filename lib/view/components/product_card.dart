import 'package:e_commerce/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:e_commerce/constants.dart';
import 'package:e_commerce/size_config.dart';

class ProductCard extends StatefulWidget {
  const ProductCard({
    this.width = 140,
    this.aspectRatio = 1.02,
    required this.product,
    required this.press,
  });
  final double width, aspectRatio;
  final ProductModel? product;
  final GestureTapCallback press;

  @override
  _ProductCardState createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: getProportionateScreenWidth(20)),
      child: GestureDetector(
        onTap: widget.press,
        child: SizedBox(
          width: getProportionateScreenWidth(widget.width),
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AspectRatio(
                    aspectRatio: widget.aspectRatio,
                    child: Container(
                      padding: EdgeInsets.all(getProportionateScreenWidth(20)),
                      decoration: BoxDecoration(
                        color: kTextColor.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Image.network(widget.product!.images![0]),
                    ),
                  ),
                  SizedBox(height: getProportionateScreenWidth(7)),
                  Text(
                    "${widget.product!.title}",
                    style: TextStyle(color: Colors.black),
                    maxLines: 2,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "\$${widget.product!.price}",
                        style: TextStyle(
                          color: kPrimaryColor,
                          fontWeight: FontWeight.w600,
                          fontSize: getProportionateScreenWidth(18),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          setState(() {
                            widget.product!.isFavourite =
                                !widget.product!.isFavourite;
                          });
                        },
                        borderRadius: BorderRadius.circular(50),
                        child: Container(
                          padding:
                              EdgeInsets.all(getProportionateScreenWidth(8)),
                          width: getProportionateScreenWidth(28),
                          height: getProportionateScreenWidth(28),
                          decoration: BoxDecoration(
                              color: widget.product!.isFavourite
                                  ? kPrimaryColor.withOpacity(0.15)
                                  : kTextColor.withOpacity(0.1),
                              shape: BoxShape.circle),
                          child: SvgPicture.asset(
                            "assets/icons/Heart Icon_2.svg",
                            color: widget.product!.isFavourite
                                ? Color(0xFFFF4848)
                                : Color(0xFFDBDEE4),
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
