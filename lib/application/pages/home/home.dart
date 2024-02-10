import 'package:flutter/material.dart';

import '../../../domain/entities/home_item.dart';
import '../../core/colors.dart';
import 'widgets/home_app_bar_bottom_banner.dart';
import 'widgets/home_calender_list.dart';
import 'widgets/home_list.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColors.homeBg,
      appBar: AppBar(
        title: SizedBox(
          height: 50,
          child: TextField(
            decoration: InputDecoration(
              hintText: '北海道, 札幌市',
              filled: true,
              fillColor: AppColors.headerTextBoxFill,
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: BorderSide.none,
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: BorderSide.none,
              ),
            ),
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.settings,
              color: AppColors.grey,
              size: 35,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.favorite_border,
              color: AppColors.redAccent,
              size: 35,
            ),
          ),
        ],
        bottom: const PreferredSize(
            preferredSize: Size(double.infinity, 40),
            child: HomeAppbarBottomBannerWidget()),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        shape: const CircleBorder(),
        child: const Icon(
          Icons.location_pin,
          color: AppColors.black,
        ),
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            HomeCalederListWidget(selectedDay: DateTime.now()),
            HomeListSection(
              // TODO list through state mangement
              items: List.generate(
                4,
                (index) => HomeItem(
                  isLiked: false,
                  image:
                      'https://static.wixstatic.com/media/11062b_e757d8e301a94451992764f76c8cf906~mv2.jpeg/v1/fill/w_1000,h_667,al_c,q_85,usm_0.66_1.00_0.01/11062b_e757d8e301a94451992764f76c8cf906~mv2.jpeg',
                  title: '介護有料老人ホームひまわり倶楽部の介護職／ヘルパー求人（パート／バイト）',
                  text1: '5月 31日（水）08 : 00 ~ 17 : 00',
                  text2: '北海道札幌市東雲町3丁目916番地17号',
                  text3: '交通費 300円',
                  text4: '住宅型有料老人ホームひまわり倶楽部',
                  badge1: '介護付き有料老人ホーム',
                  badge2: '本日まで',
                  amount: 6000,
                ),
              ),
            ),
            const SizedBox(height: 80),
          ],
        ),
      )),
    );
  }
}
