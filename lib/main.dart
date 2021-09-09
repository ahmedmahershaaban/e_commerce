import 'package:e_commerce/helper/binding.dart';
import 'package:e_commerce/view/control_view.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

import 'theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: Binding(),
      debugShowCheckedModeBanner: false,
      title: 'E_Commerce',
      theme: theme(),
      home: ControlView(),
      // routes: routes,
    );
  }
}

/// TOD*O: add the google firebase project view_model to IOS version
/// TOD*O: configure  Google login for IOS version
/// TOD*O: configure facebook login for IOS version
