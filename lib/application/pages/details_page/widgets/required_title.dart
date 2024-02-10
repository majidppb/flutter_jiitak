import 'package:flutter/material.dart';

import '../../../core/colors.dart';

class RequiredTitleWidget extends StatelessWidget {
  const RequiredTitleWidget({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        const Text(
          '*',
          style: TextStyle(color: AppColors.redAccent),
        ),
      ],
    );
  }
}
