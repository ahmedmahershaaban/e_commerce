import 'package:e_commerce/constants.dart';
import 'package:e_commerce/models/product_model.dart';
import 'package:e_commerce/size_config.dart';
import 'package:flutter/material.dart';

class SearchBarCard extends StatelessWidget {
  const SearchBarCard({
    required this.productModel,
    required this.press,
  });
  final ProductModel productModel;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Container(
        decoration: BoxDecoration(
          color: kTextColor.withOpacity(0.1),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          children: [
            SizedBox(
              width: getProportionateScreenWidth(88),
              child: AspectRatio(
                aspectRatio: 0.88,
                child: Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: Color(0xFFF5F6F9),
                      borderRadius: BorderRadius.circular(15)),
                  child: Image.network(productModel.images![0]),
                ),
              ),
            ),
            SizedBox(width: getProportionateScreenWidth(20)),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "${productModel.title}",
                    style: TextStyle(color: Colors.black, fontSize: 16),
                    maxLines: 2,
                  ),
                  SizedBox(height: 10),
                  Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: "\$${productModel.price}",
                          style: TextStyle(color: kPrimaryColor),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
