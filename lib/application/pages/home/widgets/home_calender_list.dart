import 'package:flutter/material.dart';

import '../../../core/colors.dart';
import '../../../core/styles.dart';

class HomeCalederListWidget extends StatelessWidget {
  const HomeCalederListWidget({super.key, required this.selectedDay});

  final DateTime selectedDay;

  @override
  Widget build(BuildContext context) {
    final today = DateTime.now();

    return Padding(
      padding: AppStyles.homeVPadding,
      child: SizedBox(
        width: double.infinity,
        height: 70,
        child: ListView.separated(
          padding: AppStyles.homeHPadding,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            final day = today.add(Duration(days: index));
            return _DateTile(
              day: day.day,
              isSelected:
                  day.day == selectedDay.day && day.month == selectedDay.month,
            );
          },
          separatorBuilder: (context, index) => const SizedBox(width: 10),
          itemCount: 30,
        ),
      ),
    );
  }
}

class _DateTile extends StatelessWidget {
  const _DateTile({required this.day, required this.isSelected});

  final int day;
  final bool isSelected;

  _getJapNumber(int number) => {
        0: 'ぁ',
        1: 'あ',
        2: 'ぃ',
        3: 'い',
        4: 'ぅ',
        5: 'う',
        6: 'ぇ',
        7: 'え',
        8: 'ぉ',
        9: 'お',
        10: 'か',
        11: 'が',
        12: 'き',
        13: 'ぎ',
        14: 'く',
        15: 'ぐ',
        16: 'け',
        17: 'げ',
        18: 'こ',
        19: 'ご',
        20: 'さ',
        21: 'ざ',
        22: 'し',
        23: 'じ',
        24: 'す',
        25: 'ず'
      }[number % 25];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: isSelected ? AppColors.dateContainer : null,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            _getJapNumber(day),
            style: Theme.of(context)
                .textTheme
                .titleLarge!
                .copyWith(color: isSelected ? AppColors.white : null),
          ),
          Text(
            day.toString(),
            style: Theme.of(context)
                .textTheme
                .titleLarge!
                .copyWith(color: isSelected ? AppColors.white : null),
          ),
        ],
      ),
    );
  }
}
