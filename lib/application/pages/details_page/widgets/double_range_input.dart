import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'required_title.dart';

class DoubleRangeInputFieldWidget extends StatelessWidget {
  const DoubleRangeInputFieldWidget(
      {super.key, required this.title, required this.min, required this.max});

  final double max;
  final double min;
  final String title;

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
            SizedBox(
              width: MediaQuery.of(context).size.width / 4,
              child: TextField(
                keyboardType: TextInputType.number,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                decoration: InputDecoration(
                  hintText: '¥ $min',
                  prefixText: '¥ ',
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: Text('〜'),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width / 4,
              child: TextField(
                keyboardType: TextInputType.number,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                decoration: InputDecoration(
                  hintText: '¥ $max',
                  prefixText: '¥ ',
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}
