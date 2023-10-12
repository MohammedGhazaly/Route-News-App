import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:news_app/constants/colors.dart';
import 'package:news_app/models/news_response.dart';
import 'package:news_app/screens/home/widgets/list_view_source_articles.dart';
import 'package:news_app/services/api_services.dart';
import 'package:news_app/shared_widgets/empty_articles_message.dart';
import 'package:news_app/shared_widgets/error_column_widget.dart';

class NewsArticlesBuilderBySourceId extends StatefulWidget {
  final String sourceId;
  const NewsArticlesBuilderBySourceId({super.key, required this.sourceId});

  @override
  State<NewsArticlesBuilderBySourceId> createState() =>
      _NewsArticlesBuilderBySourceIdState();
}

class _NewsArticlesBuilderBySourceIdState
    extends State<NewsArticlesBuilderBySourceId> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<NewsResponse>(
      // future: ApiServices.getNewsBySourceId(sourceId: source!.id!),
      future: ApiServices.getNewsBySourceId(sourceId: widget.sourceId),
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
            message:
                "Looks like the agency dosen't have articles published recently.",
          );
        }
        return ListViewSourceArticles(
          articles: snapshot.data!.articles ?? [],
        );
      }),
    );
  }
}
