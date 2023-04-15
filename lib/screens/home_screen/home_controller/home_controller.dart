import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zest_brain_task/network/api_repository.dart';

import '../model/on_going_model.dart';

class HomeController extends GetxController
    with GetSingleTickerProviderStateMixin {
  RxInt selectedIndex = 0.obs;
  RxBool isLoading = false.obs;
  late TabController tabController =
      Get.put(TabController(vsync: this, length: 2));
  Rx<OnGoingResponseModel> responseModel = OnGoingResponseModel().obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    tradeList("ongoing");
  }

  void tradeList(String filters) {
    isLoading(true);
    TradeListApi()
        .tradeList(
            TradeListRequestModel(filters: filters, limit: "100", offset: ""))
        .then((value) {
      isLoading(false);
      responseModel.value = value;
    });
  }
}
