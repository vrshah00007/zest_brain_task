import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:zest_brain_task/screens/login_screen/controller/login_controller.dart';

import '../../common_widget/common_widget.dart';
import '../../constants/color_constants.dart';
import '../../internet_checker/connection_manager_controller.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);
  final loginController = Get.find<LoginController>();
  final controller = Get.find<ConnectionManagerController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: ListView(
        physics: const ClampingScrollPhysics(),
        // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const SizedBox(
            height: 50,
          ),
          Center(
            child: Image.asset('asset/2.png',
                height: 150, width: 141, fit: BoxFit.cover),
          ),
          const SizedBox(
            height: 150,
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Stack(
              children: [
                Container(
                  height: 400,
                  decoration: BoxDecoration(
                      color: bgColorGradient.withOpacity(0.4),
                      borderRadius: const BorderRadius.only(
                          topRight: Radius.circular(30),
                          topLeft: Radius.circular(30))),
                ),
                Container(
                  // ignore: sort_child_properties_last'
                  height: 390,
                  alignment: Alignment.bottomCenter,
                  padding: const EdgeInsets.all(16),
                  margin: const EdgeInsets.only(top: 10),

                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(30),
                          topLeft: Radius.circular(30))),
                  child: Column(
                    // physics: const ClampingScrollPhysics(),
                    // shrinkWrap: true,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        // physics: ClampingScrollPhysics(),
                        // shrinkWrap: true,
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(left: 16),
                            child: Text('Mobile number'),
                          ),
                          TextFormField(
                            controller: loginController.mobileNumber.value,
                            decoration: const InputDecoration(
                              prefixIcon: CountryCodePicker(
                                  initialSelection: 'IN', flagWidth: 16),
                            ),
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          Obx(() => loginController.isLoading.value
                              ? Center(
                                  child: CircularProgressIndicator(
                                    color: bgColor,
                                  ),
                                )
                              : SizedBox(
                                  height: 55,
                                  width: Get.width,
                                  child: loginController.isLoading.value
                                      ? CircularProgressIndicator(
                                          color: bgColor,
                                        )
                                      : CommonButtonWidget(
                                          titleText: 'Sign Up',
                                          onPressed: () {
                                            loginController.loginAuth();
                                          },
                                          color: bgColorGradient,
                                        ),
                                )),
                          const SizedBox(
                            height: 16,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                  width: 100,
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          width: 0.2, color: Colors.black))),
                              const Text('With'),
                              Container(
                                  width: 100,
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          width: 0.2, color: Colors.black))),
                            ],
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          SizedBox(
                            height: 50,
                            width: Get.width,
                            child: ElevatedButton(
                              onPressed: () {},
                              style: ButtonStyle(
                                  elevation: const MaterialStatePropertyAll(0),
                                  backgroundColor:
                                      MaterialStatePropertyAll(btnColorRed),
                                  shape: MaterialStatePropertyAll(
                                      RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10)))),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  SvgPicture.asset('asset/google_icon.svg',
                                      width: 21, height: 21, fit: BoxFit.cover),
                                  const SizedBox(width: 110),
                                  const Text('Google' ?? '',
                                      textAlign: TextAlign.center),
                                ],
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
