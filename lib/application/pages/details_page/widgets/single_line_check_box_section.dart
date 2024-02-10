import 'package:flutter/cupertino.dart';

import 'custom_check_box.dart';
import 'required_title.dart';

class SingleLineCheckBoxSectionWidget extends StatelessWidget {
  const SingleLineCheckBoxSectionWidget(
      {super.key,
      required this.title,
      required this.value1,
      required this.value2});

  final String title;
  final String value1;
  final String value2;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        RequiredTitleWidget(title: title),
        Row(
          children: [
            CustomCheckBoxWidget(label: value1, isSelected: true),
            CustomCheckBoxWidget(label: value2, isSelected: false),
          ],
        )
      ],
    );
  }
}
