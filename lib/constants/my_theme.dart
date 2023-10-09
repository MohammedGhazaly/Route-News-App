import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/constants/colors.dart';

class MyTheme {
  static ThemeData mainTheme = ThemeData(
    useMaterial3: true,
    scaffoldBackgroundColor: Colors.transparent,
    primaryColor: MyColors.primaryColor,
    fontFamily: "Poppins",
    textTheme: TextTheme(
      labelSmall: TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: 14.sp,
      ),
      titleSmall: TextStyle(
        fontSize: 14.sp,
        color: MyColors.greyColor,
        fontWeight: FontWeight.w400,
      ),
      titleMedium: TextStyle(
        fontSize: 16.sp,
        color: MyColors.darkColor,
        fontWeight: FontWeight.w500,
      ),
    ),
  );
}
