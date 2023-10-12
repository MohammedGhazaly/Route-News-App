import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/models/news_response.dart';
import 'package:news_app/screens/article_details/article_details_screen.dart';
import 'package:news_app/shared_widgets/news_article_item.dart';

class ListViewSearchQueryArticles extends StatefulWidget {
  final List<Article> articles;
  const ListViewSearchQueryArticles({
    super.key,
    required this.articles,
  });

  @override
  State<ListViewSearchQueryArticles> createState() =>
      _ListViewSearchQueryArticlesState();
}

class _ListViewSearchQueryArticlesState
    extends State<ListViewSearchQueryArticles> {
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
