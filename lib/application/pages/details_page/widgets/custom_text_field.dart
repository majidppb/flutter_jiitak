import 'package:flutter/material.dart';

import 'required_title.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({super.key, required this.title, required this.hint});

  final String hint;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        RequiredTitleWidget(title: title),
        TextField(
          decoration: InputDecoration(hintText: hint),
        )
      ],
    );
  }
}
