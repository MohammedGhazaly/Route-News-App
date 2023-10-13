import 'package:flutter/material.dart';
import 'package:news_app/screens/search/widgets/news_articles_builder_by_search_query.dart';
import 'package:news_app/screens/search/widgets/search_app_bar.dart';

class SearchBody extends StatefulWidget {
  const SearchBody({super.key});

  @override
  State<SearchBody> createState() => _SearchBodyState();
}

class _SearchBodyState extends State<SearchBody> {
  var searchQuery = "";
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SearchAppBar(onSearchSaved: (value) {
          if (value.isNotEmpty) {
            setState(() {
              searchQuery = value;
            });
          }
        }),
        if (searchQuery.trim().isNotEmpty)
          Expanded(
              child: NewsArticlesBuilderBySearchQuery(
            searchQuery: searchQuery,
          ))
      ],
    );
  }
}
