import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/colors.dart';
import '../../details_page/details_page.dart';
import '../../home/home.dart';
import '../../second_page/second_page.dart';
import 'getx/controller.dart';

class BottomNavbar extends GetView<NavBarController> {
  const BottomNavbar({super.key});

  final _itemsBotNav = const [
    BottomNavigationBarItem(icon: Icon(Icons.search), label: 'さがす'),
    BottomNavigationBarItem(icon: Icon(Icons.folder), label: 'お仕事'),
    BottomNavigationBarItem(icon: Icon(null), label: '打刻する'),
    BottomNavigationBarItem(icon: Icon(Icons.sms), label: 'チャット'),
    BottomNavigationBarItem(icon: Icon(Icons.person), label: 'マイページ')
  ];

  final _itemsRail = const [
    NavigationRailDestination(icon: Icon(Icons.search), label: Text('さがす')),
    NavigationRailDestination(icon: Icon(Icons.folder), label: Text('お仕事')),
    NavigationRailDestination(
        icon: Icon(Icons.qr_code_rounded), label: Text('打刻する')),
    NavigationRailDestination(icon: Icon(Icons.sms), label: Text('チャット')),
    NavigationRailDestination(icon: Icon(Icons.person), label: Text('マイページ'))
  ];

  final _pages = const IndexedStack(
    children: [
      HomePage(),
      SecondPage(),
      Scaffold(body: Center(child: Text('QR PAGE'))),
      Scaffold(body: Center(child: Text('MESSAGES PAGE'))),
      DetailsPage(),
    ],
  );

  @override
  Widget build(BuildContext context) {
    Get.put(NavBarController());
    return Obx(
      () => Scaffold(
        resizeToAvoidBottomInset: false,
        body: (MediaQuery.of(context).size.aspectRatio <= 1.1)
            ? _pages.children[controller.index.value]
            : Row(
                children: [
                  NavigationRail(
                    indicatorColor: AppColors.amber,
                    selectedIndex: controller.index.value,
                    onDestinationSelected: (index) {
                      controller.index.value = index;
                    },
                    labelType: NavigationRailLabelType.all,
                    destinations: _itemsRail,
                  ),
                  Expanded(child: _pages.children[controller.index.value]),
                ],
              ),
        bottomNavigationBar: Builder(
          builder: (context) {
            if (MediaQuery.of(context).size.aspectRatio <= 1.1) {
              return BottomNavigationBar(
                type: BottomNavigationBarType.fixed,
                selectedItemColor: AppColors.amber,
                unselectedItemColor: Colors.black87,
                showUnselectedLabels: true,
                unselectedLabelStyle: const TextStyle(color: AppColors.white),
                selectedLabelStyle: const TextStyle(color: AppColors.white),
                currentIndex: controller.index.value,
                onTap: (value) {
                  controller.index.value = value;
                },
                items: _itemsBotNav,
              );
            } else {
              return const SizedBox();
            }
          },
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: Builder(builder: (context) {
          final isPortrait = MediaQuery.of(context).size.aspectRatio <= 1.1;
          if (isPortrait) {
            return FloatingActionButton(
              heroTag: 'QR',
              shape: const CircleBorder(),
              onPressed: () => controller.index.value = 2,
              child: Container(
                width: 65,
                height: 65,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(
                    colors: [
                      Color.fromARGB(255, 245, 169, 26),
                      Color.fromARGB(255, 244, 209, 144),
                    ],
                  ),
                ),
                child: const Icon(Icons.qr_code_rounded),
              ),
            );
          } else {
            return const SizedBox();
          }
        }),
      ),
    );
  }
}
