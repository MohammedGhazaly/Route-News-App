import 'package:flutter/material.dart';
import 'package:news_app/models/news_response.dart';
import 'package:news_app/services/api_services.dart';
import 'package:news_app/shared_widgets/list_view_articles.dart';

class ListViewSourceArticles extends StatefulWidget {
  final List<Article> articles;
  final String sourceId;

  const ListViewSourceArticles({
    super.key,
    required this.articles,
    required this.sourceId,
  });

  @override
  State<ListViewSourceArticles> createState() => _ListViewSourceArticlesState();
}

class _ListViewSourceArticlesState extends State<ListViewSourceArticles> {
  int page = 1;
  final int limit = 10;
  bool hasNextPage = true;
  bool isLoadingMoreData = false;
  List<Article> posts = [];
  late ScrollController controller;

  @override
  void initState() {
    // TODO: implement initState
    posts.addAll(widget.articles);
    super.initState();
    controller = ScrollController();
    controller.addListener(() {
      if (controller.offset == controller.position.maxScrollExtent) {
        fetchMoreData();
      }
    });
  }

  void fetchMoreData() async {
    page += 1;

    if (hasNextPage == true && isLoadingMoreData == false) {
      setState(() {
        isLoadingMoreData = true;
      });
    }

    try {
      final NewsResponse response = await ApiServices.getNewsBySourceId(
          page: page, sourceId: widget.sourceId);
      List<Article> fetchedData = response.articles ?? [];

      if (fetchedData.isNotEmpty) {
        setState(() {
          posts.addAll(fetchedData);
        });
      } else {
        setState(() {
          hasNextPage = false;
        });
      }
    } catch (e) {}
    setState(() {
      isLoadingMoreData = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListViewArticles(
        controller: controller,
        posts: posts,
        isLoadingMoreData: isLoadingMoreData);
  }
}
