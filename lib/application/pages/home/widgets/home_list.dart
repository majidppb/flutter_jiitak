import 'package:flutter/material.dart';

import '../../../../domain/entities/home_item.dart';
import '../../../core/colors.dart';

class HomeListSection extends StatelessWidget {
  const HomeListSection({super.key, required this.items, required this.onLike});

  final List<HomeItem> items;
  final void Function(String id) onLike;

  @override
  Widget build(BuildContext context) {
    if (MediaQuery.of(context).orientation == Orientation.portrait) {
      return ListView.separated(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) => _HomeCardWidget(
          onLike: onLike,
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
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 500,
          childAspectRatio: 330 / 410,
        ),
        // gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        //   crossAxisCount: 2,
        //   childAspectRatio: 330 / 410,
        // ),
        itemCount: items.length,
        itemBuilder: (context, index) => _HomeCardWidget(
          onLike: onLike,
          item: items[index],
          size: const Size(300, 410),
        ),
      );
    }
  }
}

class _HomeCardWidget extends StatelessWidget {
  const _HomeCardWidget(
      {required this.item, required this.size, required this.onLike});

  final HomeItem item;
  final void Function(String id) onLike;
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
                  _LikeButton(
                    isLiked: item.isLiked,
                    onLike: () => onLike(item.id),
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

class _LikeButton extends StatefulWidget {
  const _LikeButton({required this.isLiked, required this.onLike});

  final bool isLiked;
  final void Function() onLike;

  @override
  State<_LikeButton> createState() => __LikeButtonState();
}

class __LikeButtonState extends State<_LikeButton> {
  bool _isLiked = false;

  @override
  void initState() {
    _isLiked = widget.isLiked;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        widget.onLike();
        setState(() {
          _isLiked = !_isLiked;
        });
      },
      icon: _isLiked
          ? const Icon(
              Icons.favorite_rounded,
              color: AppColors.red,
              size: 30,
            )
          : const Icon(
              Icons.favorite_border_rounded,
              color: AppColors.grey,
              size: 30,
            ),
    );
  }
}
