import 'package:flutter/material.dart';
import 'package:news_app/constants/colors.dart';

class CategoryModel {
  final String id;
  final String title;
  final String image;
  final Color color;

  CategoryModel(
      {required this.id,
      required this.title,
      required this.image,
      required this.color});

  static List<CategoryModel> getCategories() {
    return [
      CategoryModel(
          id: "sports",
          title: "Sports",
          image: "assets/images/sports.png",
          color: MyColors.redColor),
      CategoryModel(
          id: "business",
          title: "Business",
          image: "assets/images/business.png",
          color: MyColors.brownColor),
      CategoryModel(
          id: "health",
          title: "Health",
          image: "assets/images/health.png",
          color: MyColors.pinkColor),
      CategoryModel(
          id: "science",
          title: "Science",
          image: "assets/images/science.png",
          color: MyColors.yellowColor),
      CategoryModel(
          id: "technology",
          title: "Technology",
          image: "assets/images/environment.png",
          color: MyColors.lightBlueColor),
      CategoryModel(
        id: "general",
        title: "General",
        image: "assets/images/politics.png",
        color: MyColors.darkBlueColor,
      ),
      CategoryModel(
        id: "entertainment",
        title: "Entertainment",
        image: "assets/images/sports.png",
        color: MyColors.primaryColor,
      ),
    ];
  }
}
