import 'dart:async';

import 'package:get/get.dart';

class DetailsPageController extends GetxController {
  final List<String?> buildingsImagesUrls1 = const [
    'assets/images/building1.png',
    'assets/images/building1.png',
    null
  ];

  final List<String> buildingsImagesUrls2 = const [
    'assets/images/building2.png',
    'assets/images/building2.png',
    'assets/images/building2.png',
  ];

  final List<String> docImagesUrls = const [
    'assets/images/doc1.png',
    'assets/images/doc2.png',
    'assets/images/doc3.png',
  ];

  final List<String> foodImagesUrls1 = [
    'assets/images/icecream.png',
    'assets/images/soda2.png',
    'assets/images/soda.png',
  ];

  final List<String> foodImagesUrls2 = const [
    'assets/images/food1.png',
    'assets/images/food2.png',
    'assets/images/food3.png',
  ];

  final String location = 'assets/images/map.png';
  final RxInt notificationsCount = 50.obs;

  /// timer for updating [notificationsCount] every 2 seconds
  late Timer _timer;

  @override
  void onClose() {
    _timer.cancel();
    super.onClose();
  }

  @override
  void onInit() {
    super.onInit();
    _timer = Timer.periodic(const Duration(seconds: 2), (timer) {
      notificationsCount.value += 2;
    });
  }
}
