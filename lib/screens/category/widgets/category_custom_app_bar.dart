import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/constants/colors.dart';
import 'package:news_app/constants/size_config.dart';

class CategoryCustomAppBar extends StatelessWidget {
  const CategoryCustomAppBar({
    super.key,
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
        child: Center(
          child: Text(
            "Categories",
            style: TextStyle(
              color: MyColors.whiteColor,
              fontWeight: FontWeight.w700,
              fontSize: 24.sp,
            ),
          ),
        )

        // child: Row(),
        );
  }
}
