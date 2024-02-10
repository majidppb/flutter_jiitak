import 'package:flutter/cupertino.dart';

import 'custom_check_box.dart';
import 'required_title.dart';

class TwoLineCheckBoxSectionWidget extends StatelessWidget {
  const TwoLineCheckBoxSectionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        RequiredTitleWidget(title: '定休日'),
        Row(
          children: [
            CustomCheckBoxWidget(label: '月', isSelected: false),
            CustomCheckBoxWidget(label: '火', isSelected: false),
            CustomCheckBoxWidget(label: '水', isSelected: false),
            CustomCheckBoxWidget(label: '木', isSelected: false),
          ],
        ),
        Row(
          children: [
            CustomCheckBoxWidget(label: '金', isSelected: false),
            CustomCheckBoxWidget(label: '土', isSelected: true),
            CustomCheckBoxWidget(label: '日', isSelected: true),
            CustomCheckBoxWidget(label: '祝', isSelected: true),
          ],
        )
      ],
    );
  }
}
