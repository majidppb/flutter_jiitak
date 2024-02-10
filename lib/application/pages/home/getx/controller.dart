import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../domain/entities/home_item.dart';

class HomePageController extends GetxController {
  final items = List.generate(
    8,
    (index) => HomeItem(
      id: index.toString(),
      isLiked: false,
      image:
          'https://static.wixstatic.com/media/11062b_e757d8e301a94451992764f76c8cf906~mv2.jpeg/v1/fill/w_1000,h_667,al_c,q_85,usm_0.66_1.00_0.01/11062b_e757d8e301a94451992764f76c8cf906~mv2.jpeg',
      title: '介護有料老人ホームひまわり倶楽部の介護職／ヘルパー求人（パート／バイト）',
      text1: '5月 31日（水）08 : 00 ~ 17 : 00',
      text2: '北海道札幌市東雲町3丁目916番地17号',
      text3: '交通費 300円',
      text4: '住宅型有料老人ホームひまわり倶楽部',
      badge1: '介護付き有料老人ホーム',
      badge2: '本日まで',
      amount: 6000,
    ),
  );

  final selectedDay = DateTime.now();

  void like(String id) {
    try {
      final index = items.indexWhere((element) => element.id == id);
      final item = items.elementAt(index);
      items.removeAt(index);
      items.insert(index, item.copyWith(isLiked: !item.isLiked));
      debugPrint('Item Liked : $id');
    } catch (e) {
      debugPrint('Unexpected error while liking: ${e.toString()}');
    }
  }
}
