import 'package:flutter/material.dart';

import '../../../core/colors.dart';

class ImageTileWidget extends StatelessWidget {
  const ImageTileWidget(
      {super.key, this.url, this.height = 100, this.width = 100});

  final double height;
  final String? url;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 5),
      height: height,
      width: width,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(url ?? 'assets/images/no_image.png'),
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      child: url == null
          ? null
          : Align(
              alignment: Alignment.topRight,
              child: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.close,
                  color: AppColors.grey,
                ),
              )),
    );
  }
}
