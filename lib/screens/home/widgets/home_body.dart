import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/screens/category/widgets/category_listview.dart';
import 'package:news_app/screens/home/widgets/home_custom_app_bar.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const HomeAppBar(),
        SizedBox(
          height: 24.h,
        ),
        Expanded(child: CategoriesListView())
        // const Expanded(child: NewsAgenciesTabs()),
      ],
    );
  }
}
