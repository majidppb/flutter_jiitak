import 'package:flutter/material.dart';

import '../../../core/colors.dart';

class NotificationsButtonWidget extends StatelessWidget {
  const NotificationsButtonWidget({super.key, required this.count});

  final int count;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.notifications_none_rounded,
              size: 35,
            )),
        Positioned(
          top: 6,
          left: 23,
          child: Container(
            width: 21,
            height: 21,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Color(0xFFEE7D42),
            ),
            alignment: Alignment.center,
            child: Text(
              count > 99 ? '99+' : count.toString(),
              style: const TextStyle(
                  fontSize: 11,
                  color: AppColors.white,
                  fontWeight: FontWeight.bold),
            ),
          ),
        )
      ],
    );
  }
}
