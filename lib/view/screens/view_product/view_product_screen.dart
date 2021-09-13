import 'package:e_commerce/core/view_model/home_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'components/body.dart';

class ViewProductScreen extends StatelessWidget {
  final int index;

  const ViewProductScreen({required this.index});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(Get.find<HomeViewModel>().bannerModel![index].title!),
      ),
      body: Body(),
    );
  }
}
