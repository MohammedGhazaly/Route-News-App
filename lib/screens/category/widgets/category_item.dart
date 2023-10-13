import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/constants/colors.dart';
import 'package:news_app/models/category_model.dart';

class CategoryItem extends StatelessWidget {
  final CategoryModel category;
  final int index;
  const CategoryItem({super.key, required this.category, required this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: category.color,
          borderRadius: BorderRadius.only(
            topLeft: const Radius.circular(20),
            topRight: const Radius.circular(20),
            bottomLeft: Radius.circular(index % 2 == 0 ? 0 : 20),
            bottomRight: Radius.circular(index % 2 != 0 ? 0 : 20),
          )),
      child: Column(
        children: [
          Image.asset(
            category.image,
            width: 100.w,
            height: 100.h,
          ),
          Text(
            category.title,
            style: TextStyle(
              fontSize: 22.sp,
              color: MyColors.whiteColor,
              fontWeight: FontWeight.w400,
            ),
          )
        ],
      ),
    );
  }
}
