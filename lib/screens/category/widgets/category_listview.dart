import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/constants/colors.dart';
import 'package:news_app/models/category_model.dart';
import 'package:news_app/screens/category/widgets/category_item.dart';

class CategoriesListView extends StatelessWidget {
  final void Function(CategoryModel categryId) onCategoryClick;
  const CategoriesListView({super.key, required this.onCategoryClick});

  @override
  Widget build(BuildContext context) {
    final List<CategoryModel> categories = CategoryModel.getCategories();
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 24.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Pick your category\nof intrest.",
            style: TextStyle(
                color: MyColors.darkGreyColor,
                fontSize: 22.sp,
                fontWeight: FontWeight.w700),
          ),
          Expanded(
            child: GridView.builder(
              itemCount: categories.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisSpacing: 15, mainAxisSpacing: 15, crossAxisCount: 2),
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    onCategoryClick(categories[index]);
                  },
                  child: CategoryItem(
                    category: categories[index],
                    index: index,
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
