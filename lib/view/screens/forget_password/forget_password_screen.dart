import 'package:flutter/material.dart';

import 'components/body.dart';

class ForgetPasswordScreen extends StatelessWidget {
  static const routeName = "/forget_pass";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("forget Password"),
      ),
      body: Body(),
    );
  }
}
