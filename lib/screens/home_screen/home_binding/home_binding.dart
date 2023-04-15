import 'package:get/get.dart';
import 'package:zest_brain_task/screens/home_screen/home_controller/home_controller.dart';

class HomeBinding extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => HomeController());
  }

}