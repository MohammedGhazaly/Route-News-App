import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:news_app/constants/colors.dart';
import 'package:news_app/models/news_response.dart';
import 'package:news_app/screens/search/widgets/list_view_search_query_articles.dart';
import 'package:news_app/services/api_services.dart';
import 'package:news_app/shared_widgets/empty_articles_message.dart';
import 'package:news_app/shared_widgets/error_column_widget.dart';

class NewsArticlesBuilderBySearchQuery extends StatefulWidget {
  final String searchQuery;
  const NewsArticlesBuilderBySearchQuery(
      {super.key, required this.searchQuery});

  @override
  State<NewsArticlesBuilderBySearchQuery> createState() =>
      _NewsArticlesBuilderBySearchQueryState();
}

class _NewsArticlesBuilderBySearchQueryState
    extends State<NewsArticlesBuilderBySearchQuery> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<NewsResponse>(
      // future: ApiServices.getNewsBySourceId(sourceId: source!.id!),
      future: ApiServices.getNewsBySearchQuery(searchQuery: widget.searchQuery),
      builder: ((context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              LoadingAnimationWidget.twoRotatingArc(
                color: MyColors.primaryColor,
                size: 30.sp,
              ),
            ],
          );
        } else if (snapshot.hasError) {
          ErrorColumnWidget(
            errorMessage: "No internet connection",
            onPressed: () {
              setState(() {});
            },
          );
        }
        if (snapshot.data?.status != "ok") {
          return ErrorColumnWidget(
            errorMessage: snapshot.data?.message ?? "Something went wrong.",
            onPressed: () {
              setState(() {});
            },
          );
        }
        if (snapshot.data?.articles?.isEmpty ?? [].isEmpty) {
          return const EmptyArticlesMessage(
            message: "Sorry, couldn't find results matching your search.",
          );
        }
        return ListViewSearchQueryArticles(
          articles: snapshot.data!.articles ?? [],
          searchQuery: widget.searchQuery,
        );
      }),
    );
  }
}
