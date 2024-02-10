import 'package:flutter/material.dart';

class CustomCheckBoxWidget extends StatelessWidget {
  const CustomCheckBoxWidget(
      {super.key, required this.label, required this.isSelected});

  final bool isSelected;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Row(
          children: [
            Checkbox(
              value: isSelected,
              onChanged: (value) {},
              activeColor: const Color(0xFFEE7D42),
              side: isSelected
                  ? null
                  : MaterialStateBorderSide.resolveWith(
                      (states) => const BorderSide(color: Color(0xFFE8E8E8)),
                    ),
            ),
            Text(
              label,
              style: Theme.of(context).textTheme.labelLarge,
            ),
            const SizedBox(width: 15),
          ],
        ),
      ],
    );
  }
}
