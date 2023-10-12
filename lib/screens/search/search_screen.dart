import 'package:flutter/material.dart';
import 'package:news_app/screens/search/widgets/search_body.dart';
import 'package:news_app/shared_widgets/background_image_overlay.dart';

class SearchScreen extends StatelessWidget {
  static String routeName = "search-screen";
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const BackgroundImageOverlay(
      widget: Scaffold(body: SearchBody()),
    );
  }
}
