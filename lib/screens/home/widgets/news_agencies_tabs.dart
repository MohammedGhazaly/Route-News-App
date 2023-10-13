import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:news_app/constants/colors.dart';
import 'package:news_app/models/category_model.dart';
import 'package:news_app/models/sources_response.dart';
import 'package:news_app/screens/home/widgets/tab_container.dart';
import 'package:news_app/services/api_services.dart';
import 'package:news_app/shared_widgets/error_column_widget.dart';

class NewsAgenciesTabs extends StatefulWidget {
  final CategoryModel categoryModel;
  const NewsAgenciesTabs({super.key, required this.categoryModel});

  @override
  State<NewsAgenciesTabs> createState() => _NewsAgenciesTabsState();
}

class _NewsAgenciesTabsState extends State<NewsAgenciesTabs> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<SourcesResponse>(
      future: ApiServices.getSources(widget.categoryModel.id),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return LoadingAnimationWidget.twoRotatingArc(
            color: MyColors.primaryColor,
            size: 30.sp,
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

        var sources = snapshot.data!.sources;
        return TabContainer(
          newsSources: sources!,
        );
      },
    );
  }
}
