import 'package:e_commerce/core/view_model/home_view_model.dart';
import 'package:e_commerce/size_config.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'components/body.dart';
import 'components/custom_app_bar.dart';

class DetailsScreen extends StatelessWidget {
  static const String routeName = "/details";
  final int index;
  final bool filtered;
  DetailsScreen({
    required this.index,
    this.filtered = false,
  });
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: Color(0xFFF5F6F9),
      appBar: CustomAppBar(
        rating: filtered
            ? Get.find<HomeViewModel>().productModel![index].rating
            : Get.find<HomeViewModel>().filteredProductModel![index].rating,
      ),
      body: Body(index: index, filtered: filtered),
    );
  }
}
