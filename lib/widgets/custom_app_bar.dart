import 'package:anim_search_bar/anim_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/constants/colors.dart';
import 'package:news_app/constants/size_config.dart';

class CustomAppBar extends StatefulWidget {
  const CustomAppBar({
    super.key,
  });

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  TextEditingController textEditingController = TextEditingController();

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
            onPressed: () {},
            icon: Icon(
              Icons.menu,
              color: MyColors.whiteColor,
              size: 36,
            ),
          ),
          AnimSearchBar(
            boxShadow: false,
            color: Colors.transparent,
            helpText: "Search article",
            searchIconColor: MyColors.whiteColor,
            prefixIcon: Icon(
              Icons.search,
              color: MyColors.whiteColor,
              shadows: null,
              size: 36,
            ),
            width: SizeConfig.screenWidth * 0.75,
            textController: textEditingController,
            onSuffixTap: () {},
            onSubmitted: (value) {},
          ),
        ],
      ),
      // child: Row(),
    );
  }
}
