import 'package:flutter/material.dart';

import '../../../core/colors.dart';

class HomeAppbarBottomBannerWidget extends StatelessWidget {
  const HomeAppbarBottomBannerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 10),
        Container(
          alignment: Alignment.center,
          height: 30,
          width: double.infinity,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                AppColors.gradient1,
                AppColors.gradient2,
              ],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            ),
          ),
          child: const Text('2022年 5月 26日（木）'),
        ),
      ],
    );
  }
}
