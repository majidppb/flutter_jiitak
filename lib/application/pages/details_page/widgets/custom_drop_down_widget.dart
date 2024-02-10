import 'package:flutter/material.dart';

import 'required_title.dart';

class CustomDropDownWidget<T> extends StatelessWidget {
  const CustomDropDownWidget(
      {super.key,
      required this.title,
      required this.hint,
      required this.items,
      required this.mapper,
      required this.onChanged});

  final void Function(T?)? onChanged;
  final String hint;
  final List<T> items;

  /// The mapping function for converting [T] to [DropdownMenuItem]
  final DropdownMenuItem<T> Function(T item) mapper;

  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        RequiredTitleWidget(title: title),
        Container(
          height: 45,
          decoration: BoxDecoration(
              border: Border.all(color: const Color(0xFFE8E8E8)),
              borderRadius: BorderRadius.circular(8)),
          child: DropdownButton<T>(
            elevation: 0,
            padding: const EdgeInsets.symmetric(horizontal: 8),
            underline: const SizedBox(),
            hint: Text(hint),
            items: items.map(mapper).toList(),
            onChanged: onChanged,
          ),
        )
      ],
    );
  }
}
