import 'package:flutter/material.dart';
import 'package:news_app/constants/colors.dart';

class MyTheme {
  static ThemeData mainTheme = ThemeData(
    useMaterial3: true,
    scaffoldBackgroundColor: Colors.transparent,
    primaryColor: MyColors.primaryColor,
    textTheme: TextTheme(),
  );
}
