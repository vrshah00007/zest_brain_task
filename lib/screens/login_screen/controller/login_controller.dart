import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zest_brain_task/network/api_repository.dart';
import 'package:zest_brain_task/screens/home_screen/home_screen.dart';
import 'package:zest_brain_task/screens/login_screen/model/login_model.dart';

import '../../../constants/global_variable.dart';
import '../../../routes/routes_name.dart';
import '../../home_screen/home_binding/home_binding.dart';

class LoginController extends GetxController {
  Rx<TextEditingController> mobileNumber =
      TextEditingController(text: '9773239952').obs;
  RxBool isLoading = false.obs;
  Rx<LoginData> loginResponseModel = LoginData().obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    // loginAuth();
  }

  loginAuth() {
    isLoading.value = true;
    LoginRepository()
        .fetchAuth(LoginRequestModel(
            countryCode: '+91',
            deviceId: 'N832948jdshjsi23478923',
            deviceType: Platform.isAndroid ? 'android' : 'ios',
            mobile: '9773239952',
            otp: '6729'))
        .then((value) {
      isLoading.value = false;
      token = value?.token;
      loginResponseModel.value = value!;
      HomeBinding().dependencies();
      Get.to(() => HomeScreen(), binding: HomeBinding());
    });
  }
}
