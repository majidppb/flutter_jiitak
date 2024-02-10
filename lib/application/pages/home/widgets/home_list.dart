import 'package:flutter/material.dart';

import '../../../../domain/entities/home_item.dart';
import '../../../core/colors.dart';

class HomeListSection extends StatelessWidget {
  const HomeListSection({super.key, required this.items});

  final List<HomeItem> items;

  @override
  Widget build(BuildContext context) {
    if (MediaQuery.of(context).orientation == Orientation.portrait) {
      return ListView.separated(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) => _HomeCardWidget(
          item: items[index],
          size: const Size(300, 410),
        ),
        separatorBuilder: (context, index) => const SizedBox(height: 10),
        itemCount: items.length,
      );
    } else {
      return GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 330 / 410,
        ),
        itemCount: items.length,
        itemBuilder: (context, index) => _HomeCardWidget(
          item: items[index],
          size: const Size(300, 410),
        ),
      );
    }
  }
}

class _HomeCardWidget extends StatelessWidget {
  const _HomeCardWidget({required this.item, required this.size});

  final HomeItem item;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.loose,
      alignment: Alignment.center,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              item.image != null
                  ? Image.network(
                      item.image!,
                      width: size.width,
                      height: size.height / 2,
                    )
                  : SizedBox(height: size.height / 2),
              Container(
                width: size.width,
                height: size.height / 2,
                color: AppColors.homeItemCardBg,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        item.title,
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          _BadgeWidget(
                              text: item.badge1,
                              bgColor: const Color(0xFFFDF7EC),
                              color: AppColors.amber),
                          Text(
                            '¥ ${item.amount}',
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                        ],
                      ),
                      Text(item.text1),
                      Text(item.text2),
                      Text(item.text3),
                      Text(
                        item.text4,
                        style: const TextStyle(color: AppColors.grey),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          width: size.width + 20,
          height: size.height,
          child: Column(
            children: [
              const Spacer(),
              Row(
                children: [
                  _BadgeWidget(
                    bgColor: AppColors.red,
                    color: AppColors.white,
                    text: item.badge2,
                  ),
                  const Spacer(),
                ],
              ),
              const SizedBox(height: 40),
              const Spacer()
            ],
          ),
        ),
        SizedBox(
          width: size.width,
          height: size.height,
          child: Column(
            children: [
              const Spacer(),
              Row(
                children: [
                  const Spacer(),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.favorite_border_rounded,
                      color: AppColors.grey,
                      size: 30,
                    ),
                  ),
                  const SizedBox(width: 10),
                ],
              ),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ],
    );
  }
}

class _BadgeWidget extends StatelessWidget {
  const _BadgeWidget({
    required this.bgColor,
    required this.color,
    required this.text,
  });

  final Color bgColor;
  final Color color;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 3),
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Center(
        child: Text(
          text,
          style: TextStyle(color: color),
        ),
      ),
    );
  }
}
