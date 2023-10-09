import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/screens/home/widgets/news_agencies_tabs.dart';
import 'package:news_app/screens/home/widgets/home_custom_app_bar.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        HomeAppBar(),
        SizedBox(
          height: 24.h,
        ),
        NewsAgenciesTabs(),
      ],
    );
  }
}
