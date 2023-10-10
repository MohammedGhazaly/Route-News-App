import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/models/news_response.dart';
import 'package:news_app/screens/article_details/article_details_screen.dart';
import 'package:news_app/widgets/news_article_item.dart';

class ListViewSourceArticles extends StatefulWidget {
  final List<Article> articles;
  const ListViewSourceArticles({
    super.key,
    required this.articles,
  });

  @override
  State<ListViewSourceArticles> createState() => _ListViewSourceArticlesState();
}

class _ListViewSourceArticlesState extends State<ListViewSourceArticles> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 25.w),
      child: ListView.builder(
        itemCount: widget.articles.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              Navigator.pushNamed(context, ArticleDetailsScreen.routeName,
                  arguments: widget.articles[index]);
            },
            child: NewsArticleItem(
              artilce: widget.articles[index],
            ),
          );
        },
      ),
    );
  }
}
