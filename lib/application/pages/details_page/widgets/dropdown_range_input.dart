import 'package:flutter/material.dart';

import 'required_title.dart';

class DopdownRangeInputFieldWidget<T> extends StatelessWidget {
  const DopdownRangeInputFieldWidget(
      {super.key,
      required this.title,
      required this.min,
      required this.max,
      required this.items,
      required this.mapper,
      this.onChanged});

  final void Function(T?)? onChanged;
  final List<T> items;

  /// The mapping function for converting [T] to [DropdownMenuItem]
  final DropdownMenuItem<T> Function(T item) mapper;

  final String max;
  final String min;
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
            Container(
              height: 45,
              decoration: BoxDecoration(
                  border: Border.all(color: const Color(0xFFE8E8E8)),
                  borderRadius: BorderRadius.circular(8)),
              child: DropdownButton<T>(
                elevation: 0,
                padding: const EdgeInsets.symmetric(horizontal: 8),
                underline: const SizedBox(),
                hint: Text(min),
                items: items.map(mapper).toList(),
                onChanged: onChanged,
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: Text('〜'),
            ),
            Container(
              height: 45,
              decoration: BoxDecoration(
                  border: Border.all(color: const Color(0xFFE8E8E8)),
                  borderRadius: BorderRadius.circular(8)),
              child: DropdownButton<T>(
                elevation: 0,
                padding: const EdgeInsets.symmetric(horizontal: 8),
                underline: const SizedBox(),
                hint: Text(max),
                items: items.map(mapper).toList(),
                onChanged: onChanged,
              ),
            ),
          ],
        )
      ],
    );
  }
}
