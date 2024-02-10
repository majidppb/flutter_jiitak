import 'package:flutter/material.dart';

import '../../../core/colors.dart';
import 'image_tile.dart';

class ImageSectionWidget extends StatelessWidget {
  const ImageSectionWidget(
      {super.key,
      required this.title1,
      required this.title2,
      required this.urls});

  final String title1;
  final String title2;
  final List<String?> urls;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              title1,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const Text(
              '*',
              style: TextStyle(color: AppColors.redAccent),
            ),
            const SizedBox(width: 3),
            Text(
              '($title2)',
              softWrap: true,
              style: Theme.of(context)
                  .textTheme
                  .titleSmall!
                  .copyWith(color: AppColors.grey),
            )
          ],
        ),
        Row(mainAxisAlignment: MainAxisAlignment.start, children: [
          ImageTileWidget(url: urls[0]),
          ImageTileWidget(url: urls[1]),
          ImageTileWidget(url: urls[2]),
        ])
      ],
    );
  }
}
