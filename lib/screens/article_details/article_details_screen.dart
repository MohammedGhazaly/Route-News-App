import 'package:flutter/material.dart';
import 'package:news_app/models/news_response.dart';
import 'package:news_app/screens/article_details/widgets/article_details_body.dart';
import 'package:news_app/widgets/background_image_overlay.dart';

class ArticleDetailsScreen extends StatelessWidget {
  static String routeName = "article-details-screen";
  const ArticleDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var articleArgs = ModalRoute.of(context)?.settings.arguments as Article;
    return BackgroundImageOverlay(
      widget: BackgroundImageOverlay(
        widget: Scaffold(
          body: ArticleDetailsBody(article: articleArgs),
        ),
      ),
    );
  }
}
