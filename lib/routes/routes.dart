import 'package:get/get.dart';
import 'package:zest_brain_task/routes/routes_name.dart';
import 'package:zest_brain_task/screens/home_screen/home_screen.dart';
import 'package:zest_brain_task/screens/login_screen/login.dart';

final getPages = [
  GetPage(
    name: RoutesName.loginScreen,
    page: () => LoginScreen(),
  ),
  GetPage(
    name: RoutesName.homeScreen,
    page: () => HomeScreen(),
  ),
];
