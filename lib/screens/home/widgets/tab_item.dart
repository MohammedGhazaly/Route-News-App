import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/constants/colors.dart';
import 'package:news_app/models/sources_response.dart';

class TabItem extends StatelessWidget {
  final Source source;
  final bool isSelected;
  const TabItem({super.key, required this.source, required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 20.w),
      decoration: BoxDecoration(
        color: isSelected == true ? MyColors.primaryColor : Colors.transparent,
        borderRadius: BorderRadius.circular(50),
        border: Border.all(
          color: MyColors.primaryColor,
          width: 2,
        ),
      ),
      child: Text(
        source.name ?? "Not found",
        style: Theme.of(context).textTheme.labelSmall!.copyWith(
              color: isSelected == true
                  ? MyColors.whiteColor
                  : MyColors.primaryColor,
            ),
      ),
    );
  }
}
