import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:news_app/constants/colors.dart';
import 'package:news_app/models/sources_response.dart';
import 'package:news_app/screens/home/widgets/tab_container.dart';
import 'package:news_app/services/api_services.dart';

class NewsAgenciesTabs extends StatefulWidget {
  const NewsAgenciesTabs({super.key});

  @override
  State<NewsAgenciesTabs> createState() => _NewsAgenciesTabsState();
}

class _NewsAgenciesTabsState extends State<NewsAgenciesTabs> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<SourcesResponse>(
      future: ApiServices.getSources(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: LoadingAnimationWidget.twoRotatingArc(
              color: MyColors.primaryColor,
              size: 30.sp,
            ),
          );
        } else if (snapshot.hasError) {
          return const Column(
            children: [
              Text(
                "Something went wrong.",
              )
            ],
          );
        }
        if (snapshot.data?.status != "ok") {
          return Column(
            children: [Text(snapshot.data?.message ?? "Something went wrong")],
          );
        }

        var sources = snapshot.data!.sources;
        return TabContainer(newsSources: sources!);
      },
    );
  }
}
