import 'package:get/get.dart';

import '../../../../domain/entities/second_page_list_item.dart';

class SecondPageController extends GetxController {
  final items = List.generate(
    10,
    (index) => SecondPageListItem(
        date: DateTime.now().subtract(Duration(days: index)),
        content: 'スタンプを獲得しました。',
        content2: '1 個'),
  );
}
