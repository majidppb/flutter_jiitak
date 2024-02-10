import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../core/colors.dart';
import 'widgets/card_section.dart';
import 'widgets/list_section.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondPageBg,
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: CircleAvatar(
              radius: 10,
              backgroundColor: const Color(0xFF949EFF),
              child: IconButton(
                  onPressed: () {}, icon: const Icon(CupertinoIcons.back))),
        ),
        centerTitle: true,
        titleTextStyle: const TextStyle(color: AppColors.white),
        title: const Text('スタンプカード詳細'),
        backgroundColor: AppColors.secondPageBg,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.remove_circle_outline_rounded,
              color: AppColors.white,
            ),
          )
        ],
        bottom: const PreferredSize(
            preferredSize: Size(double.infinity, 60),
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Text(
                    'Mer キッチン',
                    style: TextStyle(color: AppColors.white),
                  ),
                  Spacer(),
                  Text(
                    '現在の獲得数',
                    style: TextStyle(color: AppColors.white),
                  ),
                  Text(
                    '30',
                    style: TextStyle(fontSize: 30, color: AppColors.white),
                  ),
                  Text(
                    '個',
                    style: TextStyle(color: AppColors.white),
                  ),
                ],
              ),
            )),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
          color: AppColors.white,
        ),
        child: const SingleChildScrollView(
          child: Column(
            children: [
              CardSectionWidget(),
              ListSectionWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
