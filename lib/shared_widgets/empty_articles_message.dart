import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/constants/colors.dart';

class EmptyArticlesMessage extends StatelessWidget {
  final String message;
  const EmptyArticlesMessage({
    super.key,
    required this.message,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          message,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: MyColors.blackColor,
            fontSize: 24.sp,
          ),
        ),
      ],
    );
  }
}
