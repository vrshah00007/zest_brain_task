import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zest_brain_task/screens/home_screen/home_controller/home_controller.dart';

import '../../constants/color_constants.dart';
import 'widget/ongoing_list_widget.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);
  final homeController = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: bgColor,
        automaticallyImplyLeading: false,
        centerTitle: true,
        actions: const [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(Icons.filter_list),
          )
        ],
        title: const Text(
          'Trade Recommendations',
          style: TextStyle(fontSize: 18),
        ),
        shape: const ContinuousRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(20.0),
            bottomRight: Radius.circular(20.0),
          ),
        ),
        elevation: 0,
      ),
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            padding: const EdgeInsets.all(4),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(
                24,
              ),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black12,
                  offset: Offset(
                    0,
                    4,
                  ),
                ),
              ],
            ),
            child: TabBar(
              onTap: (value) {
                if (value == 0) {
                  homeController.tradeList('ongoing');
                } else {
                  homeController.tradeList('expired');
                }
              },
              controller: homeController.tabController,
              labelColor: Colors.white,
              labelStyle: const TextStyle(
                fontSize: 14,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w600,
              ),
              unselectedLabelColor: Colors.grey,
              unselectedLabelStyle: const TextStyle(
                fontSize: 14,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w600,
              ),
              // indicatorPadding: getPadding(
              //   all: 5.0,
              // ),
              indicator: BoxDecoration(
                borderRadius: BorderRadius.circular(
                  24,
                ),
                gradient: LinearGradient(
                  begin: const Alignment(
                    0.5,
                    0,
                  ),
                  end: const Alignment(
                    0.5,
                    1,
                  ),
                  colors: [
                    bgColorGradient,
                    bgColorGradient,
                  ],
                ),
              ),
              tabs: const [
                Tab(
                  child: Text(
                    "Ongoing Trades",
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Tab(
                  child: Text(
                    "Expired Trades",
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: TextFormField(
              decoration: InputDecoration(
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  label: const Text('Search by stock or mentor name'),
                  border: InputBorder.none,
                  disabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Colors.grey)),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Colors.grey)),
                  errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Colors.grey)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Colors.grey)),
                  focusedErrorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Colors.grey)),
                  suffixIcon: const Icon(Icons.search)),
            ),
          ),
          Container(
            height: Get.height * 0.7,
            child: TabBarView(
              controller: homeController.tabController,
              children: [
                OngoingListWidget(),
                OngoingListWidget(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
