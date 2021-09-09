import 'package:e_commerce/models/product_model.dart';
import 'package:e_commerce/size_config.dart';
import 'package:flutter/material.dart';

import 'components/body.dart';
import 'components/custom_app_bar.dart';

class DetailsScreen extends StatelessWidget {
  static const String routeName = "/details";
  final ProductModel productModel;
  DetailsScreen({required this.productModel});
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: Color(0xFFF5F6F9),
      appBar: CustomAppBar(rating: productModel.rating),
      body: Body(
        product: productModel,
      ),
    );
  }
}
