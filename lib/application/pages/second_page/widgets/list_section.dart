import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../domain/entities/second_page_list_item.dart';
import '../../../core/colors.dart';
import '../getx/controller.dart';

class ListSectionWidget extends GetView<SecondPageController> {
  const ListSectionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;

    return Padding(
      padding: isPortrait
          ? EdgeInsets.zero
          : const EdgeInsets.symmetric(horizontal: 100),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Text(
              'スタンプ獲得履歴',
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
          ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            cacheExtent: 5,
            itemBuilder: (context, index) =>
                _ListItem(item: controller.items[index]),
            separatorBuilder: (context, index) => const Divider(
              indent: 20,
              endIndent: 20,
              color: Color.fromARGB(255, 196, 194, 194),
            ),
            itemCount: controller.items.length,
          ),
        ],
      ),
    );
  }
}

class _ListItem extends StatelessWidget {
  const _ListItem({required this.item});

  final SecondPageListItem item;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            '${item.date.year} / ${item.date.month} / ${item.date.day}',
            style: const TextStyle(color: AppColors.grey),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(item.content),
              Text(
                item.content2,
                style: Theme.of(context).textTheme.titleMedium,
              )
            ],
          )
        ],
      ),
    );
  }
}
