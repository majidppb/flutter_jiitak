import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../core/colors.dart';
import 'widgets/custom_drop_down_widget.dart';
import 'widgets/custom_text_field.dart';
import 'widgets/dropdown_range_input.dart';
import 'widgets/image_section.dart';
import 'widgets/image_tile.dart';
import 'widgets/notifications_button.dart';
import 'widgets/double_range_input.dart';
import 'widgets/single_line_check_box_section.dart';
import 'widgets/two_line_check_box_section.dart';

class DetailsPage extends StatelessWidget {
  DetailsPage({super.key});

  final items = [
    const CustomTextField(title: '店舗名', hint: 'Mer キッチン'),
    const CustomTextField(title: '代表担当者名', hint: '林田　絵梨花'),
    const CustomTextField(title: '店舗電話番号', hint: '123 - 4567 8910'),
    const CustomTextField(title: '店舗住所', hint: '大分県豊後高田市払田791-13'),
    Container(
      width: double.infinity,
      height: 300,
      decoration: BoxDecoration(
        image: const DecorationImage(
          image: AssetImage('assets/images/map.png'),
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.circular(8),
      ),
    ),
    const ImageSectionWidget(
      title1: '店舗外観',
      title2: '最大3枚まで',
      urls: [
        'assets/images/building1.png',
        'assets/images/building1.png',
        null
      ],
    ),
    const ImageSectionWidget(
      title1: '店舗内観',
      title2: '1枚〜3枚ずつ追加してください',
      urls: [
        'assets/images/building2.png',
        'assets/images/building2.png',
        'assets/images/building2.png',
      ],
    ),
    const ImageSectionWidget(
      title1: '料理写真',
      title2: '1枚〜3枚ずつ追加してください',
      urls: [
        'assets/images/food1.png',
        'assets/images/food2.png',
        'assets/images/food3.png',
      ],
    ),
    const ImageSectionWidget(
      title1: 'メニュー写真',
      title2: '1枚〜3枚ずつ追加してください',
      urls: [
        'assets/images/doc1.png',
        'assets/images/doc2.png',
        'assets/images/doc3.png',
      ],
    ),
    DopdownRangeInputFieldWidget(
      title: '営業時間',
      min: '10 : 00',
      max: '20 : 00',
      items: const [],
      mapper: (item) => DropdownMenuItem(child: Text(item.toString())),
    ),
    DopdownRangeInputFieldWidget(
      title: 'ランチ時間',
      min: '11 : 00',
      max: '15 : 00',
      items: const [],
      mapper: (item) => DropdownMenuItem(child: Text(item.toString())),
    ),
    const TwoLineCheckBoxSectionWidget(),
    CustomDropDownWidget(
      title: '料理カテゴリー',
      hint: '料理カテゴリー選択',
      items: const [],
      mapper: (item) => DropdownMenuItem(child: Text(item.toString())),
      onChanged: (item) {},
    ),
    const DoubleRangeInputFieldWidget(title: '予算', min: 1000, max: 2000),
    const CustomTextField(title: 'キャッチコピー', hint: '美味しい！リーズナブルなオムライスランチ！'),
    const CustomTextField(title: '座席数', hint: '40席'),
    const SingleLineCheckBoxSectionWidget(
        title: '喫煙席', value1: '有', value2: '無'),
    const SingleLineCheckBoxSectionWidget(
        title: '駐車場', value1: '有', value2: '無'),
    const SingleLineCheckBoxSectionWidget(
        title: '来店プレゼント', value1: '有（最大３枚まで', value2: '無'),
    const Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        ImageTileWidget(url: 'assets/images/icecream.png'),
        ImageTileWidget(url: 'assets/images/soda2.png'),
        ImageTileWidget(url: 'assets/images/soda.png'),
      ],
    ),
    const CustomTextField(title: '来店プレゼント名', hint: 'いちごクリームアイスクリーム, ジュース'),
    const SizedBox(height: 30),
    MaterialButton(
      onPressed: null,
      minWidth: double.infinity,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
      height: 50,
      disabledColor: const Color(0xFFF7BEA1),
      textColor: AppColors.white,
      child: const Text('編集を保存'),
    ),
    const SizedBox(height: 40),
  ];

  @override
  Widget build(BuildContext context) {
    final isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: CircleAvatar(
              radius: 10,
              backgroundColor: const Color(0xFFF4F2F2),
              child: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    CupertinoIcons.back,
                    color: Color(0xFFB8B8B8),
                  ))),
        ),
        centerTitle: true,
        title: const Text('スタンプカード詳細'),
        actions: const [
          NotificationsButtonWidget(count: 9), // TODO state mangement
        ],
      ),
      body: SafeArea(
        minimum: isPortrait
            ? const EdgeInsets.all(10)
            : const EdgeInsets.symmetric(
                vertical: 10,
                horizontal: 100,
              ),
        child: ListView.separated(
          itemBuilder: (context, index) => items[index],
          separatorBuilder: (context, index) => const SizedBox(height: 10),
          itemCount: items.length,
        ),
      ),
    );
  }
}
