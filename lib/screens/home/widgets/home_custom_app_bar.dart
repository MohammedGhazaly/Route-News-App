import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/constants/colors.dart';
import 'package:news_app/constants/size_config.dart';
import 'package:news_app/screens/search/search_screen.dart';

class HomeAppBar extends StatelessWidget {
  final void Function()? openDrawer;
  const HomeAppBar({
    super.key,
    required this.openDrawer,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 25.h),
      width: SizeConfig.screenWidth,
      height: SizeConfig.screenHeight * 0.15,
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(50.w),
          bottomRight: Radius.circular(50.w),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            padding: EdgeInsets.zero,
            onPressed: openDrawer,
            icon: Icon(
              Icons.menu,
              color: MyColors.whiteColor,
              size: 36,
            ),
          ),
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, SearchScreen.routeName);
            },
            icon: Icon(
              Icons.search,
              color: MyColors.whiteColor,
              shadows: null,
              size: 36,
            ),
          )
        ],
      ),
      // child: Row(),
    );
  }
}
