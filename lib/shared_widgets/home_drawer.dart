import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/constants/colors.dart';
import 'package:news_app/constants/size_config.dart';

class HomeDrawer extends StatelessWidget {
  final Function() onSideMenuClicked;
  const HomeDrawer({
    super.key,
    required this.onSideMenuClicked,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: SizeConfig.screenWidth,
          height: SizeConfig.screenHeight * 0.2,
          decoration: BoxDecoration(color: MyColors.primaryColor),
          child: Center(
            child: Text(
              "News App",
              style: TextStyle(
                  fontSize: 24.sp,
                  color: MyColors.whiteColor,
                  fontWeight: FontWeight.w700),
            ),
          ),
        ),
        SizedBox(
          height: 30.h,
        ),
        InkWell(
          onTap: () {
            onSideMenuClicked();
          },
          child: Row(
            children: [
              const SizedBox(
                width: 10,
              ),
              Icon(
                Icons.format_list_bulleted,
                size: 36,
                color: MyColors.blackColor,
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                "Categoreis",
                style: TextStyle(
                    fontSize: 24.sp,
                    fontWeight: FontWeight.bold,
                    color: MyColors.blackColor),
              )
            ],
          ),
        )
      ],
    );
  }
}
