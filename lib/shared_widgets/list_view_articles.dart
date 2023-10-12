import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:news_app/constants/colors.dart';
import 'package:news_app/models/news_response.dart';
import 'package:news_app/screens/article_details/article_details_screen.dart';
import 'package:news_app/shared_widgets/news_article_item.dart';

class ListViewArticles extends StatelessWidget {
  const ListViewArticles({
    super.key,
    required this.controller,
    required this.posts,
    required this.isLoadingMoreData,
  });

  final ScrollController controller;
  final List<Article> posts;
  final bool isLoadingMoreData;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 25.w),
            child: ListView.builder(
              controller: controller,
              itemCount: posts.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, ArticleDetailsScreen.routeName,
                        arguments: posts[index]);
                  },
                  child: NewsArticleItem(
                    artilce: posts[index],
                  ),
                );
              },
            ),
          ),
        ),
        if (isLoadingMoreData == true)
          Padding(
            padding: const EdgeInsets.only(top: 10, bottom: 40),
            child: LoadingAnimationWidget.twoRotatingArc(
              color: MyColors.primaryColor,
              size: 30.sp,
            ),
          )
      ],
    );
  }
}
