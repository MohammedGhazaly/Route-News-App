import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:news_app/constants/colors.dart';
import 'package:news_app/models/news_response.dart';
import 'package:news_app/screens/search/widgets/list_view_search_query_articles.dart';
import 'package:news_app/services/api_services.dart';
import 'package:news_app/widgets/empty_articles_message.dart';
import 'package:news_app/widgets/not_okay_status.dart';

class NewsArticlesBuilderBySearchQuery extends StatelessWidget {
  final String searchQuery;
  const NewsArticlesBuilderBySearchQuery(
      {super.key, required this.searchQuery});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<NewsResponse>(
      // future: ApiServices.getNewsBySourceId(sourceId: source!.id!),
      future: ApiServices.getNewsBySearchQuery(searchQuery: searchQuery),
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
          return NotOkayStatus(
            message: snapshot.data?.message ?? "Something went wrong.",
          );
        }
        if (snapshot.data?.status != "ok") {
          return NotOkayStatus(
            message: snapshot.data?.message ?? "Something went wrong.",
          );
        }
        if (snapshot.data?.articles?.isEmpty ?? [].isEmpty) {
          return const EmptyArticlesMessage();
        }
        return ListViewSearchQueryArticles(
          articles: snapshot.data!.articles ?? [],
        );
      }),
    );
  }
}
