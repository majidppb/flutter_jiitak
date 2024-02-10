import 'package:flutter/material.dart';
import 'dart:math';

import '../../../core/colors.dart';

class CardSectionWidget extends StatelessWidget {
  const CardSectionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          width: double.infinity,
          height: 250,
          child: ListView.separated(
            padding: isPortrait
                ? const EdgeInsets.all(15)
                : const EdgeInsets.symmetric(vertical: 30, horizontal: 100),
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) => const _CardWidget(),
            separatorBuilder: (context, index) => const SizedBox(width: 30),
            itemCount: 2,
          ),
        ),
        Padding(
          padding: isPortrait
              ? const EdgeInsets.only(right: 15)
              : const EdgeInsets.only(right: 130),
          child: const Text('2 / 2枚目'),
        ),
      ],
    );
  }
}

class _CardWidget extends StatelessWidget {
  const _CardWidget();

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 100,
        width: 300,
        decoration: BoxDecoration(
          boxShadow: const [
            BoxShadow(
              color: Color.fromARGB(255, 167, 167, 167),
              blurRadius: 8,
              blurStyle: BlurStyle.outer,
            )
          ],
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: List.generate(
              3,
              (index) => Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: List.generate(
                        5,
                        (index) => Stack(
                              alignment: Alignment.center,
                              children: [
                                SizedBox(
                                  width: 30,
                                  height: 30,
                                  child: CustomPaint(
                                    painter: _RosettePainter(
                                        const Color(0xFFFBB087)),
                                  ),
                                ),
                                const Icon(
                                  Icons.check_rounded,
                                  color: AppColors.white,
                                )
                              ],
                            )),
                  )),
        ));
  }
}

class _RosettePainter extends CustomPainter {
  _RosettePainter(this.color);

  final Color color;

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()..color = color;
    final double radius = size.width / 2;
    final double centerX = size.width / 2;
    final double centerY = size.height / 2;

    canvas.drawCircle(Offset(centerX, centerY), radius, paint);

    final double smallRadius = radius / 2;

    for (int i = 0; i < 8; i++) {
      final double angle = i * (2 * pi / 8);
      final double x = centerX + radius * cos(angle);
      final double y = centerY + radius * sin(angle);
      canvas.drawCircle(Offset(x, y), smallRadius, paint);
    }
  }

  @override
  bool shouldRebuildSemantics(_RosettePainter oldDelegate) => false;

  @override
  bool shouldRepaint(_RosettePainter oldDelegate) => false;
}
