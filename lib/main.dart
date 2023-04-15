import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'internet_checker/controller_binding.dart';
import 'screens/login_screen/binding/login_binding.dart';
import 'screens/login_screen/login.dart';

void main() {
  LoginBinding().dependencies();
  ControllerBinding().dependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),

      home: LoginScreen(),
    );
  }
}
