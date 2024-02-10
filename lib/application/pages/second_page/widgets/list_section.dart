import 'package:flutter/material.dart';

import '../../../core/colors.dart';

class ListSectionWidget extends StatelessWidget {
  const ListSectionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final today = DateTime.now();
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
                _ListItem(date: today.subtract(const Duration(days: 1))),
            separatorBuilder: (context, index) => const Divider(
              indent: 20,
              endIndent: 20,
              color: Color.fromARGB(255, 196, 194, 194),
            ),
            itemCount: 10,
          ),
        ],
      ),
    );
  }
}

class _ListItem extends StatelessWidget {
  const _ListItem({required this.date});

  final DateTime date;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            '${date.year} / ${date.month} / ${date.day}',
            style: const TextStyle(color: AppColors.grey),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('スタンプを獲得しました。'),
              Text(
                '1 個',
                style: Theme.of(context).textTheme.titleMedium,
              )
            ],
          )
        ],
      ),
    );
  }
}
