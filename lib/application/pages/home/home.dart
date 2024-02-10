import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/colors.dart';
import 'getx/controller.dart';
import 'widgets/home_app_bar_bottom_banner.dart';
import 'widgets/home_calender_list.dart';
import 'widgets/home_list.dart';

class HomePage extends GetView<HomePageController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomePageController());
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColors.homeBg,
      appBar: AppBar(
        title: SizedBox(
          height: 50,
          child: TextField(
            decoration: InputDecoration(
              hintText: '北海道, 札幌市',
              filled: true,
              fillColor: AppColors.headerTextBoxFill,
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: BorderSide.none,
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: BorderSide.none,
              ),
            ),
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.settings,
              color: AppColors.grey,
              size: 35,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.favorite_border,
              color: AppColors.redAccent,
              size: 35,
            ),
          ),
        ],
        bottom: const PreferredSize(
            preferredSize: Size(double.infinity, 40),
            child: HomeAppbarBottomBannerWidget()),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        shape: const CircleBorder(),
        child: const Icon(
          Icons.location_pin,
          color: AppColors.black,
        ),
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            HomeCalederListWidget(selectedDay: controller.selectedDay),
            HomeListSection(
              items: controller.items,
              onLike: controller.like,
            ),
            const SizedBox(height: 80),
          ],
        ),
      )),
    );
  }
}
