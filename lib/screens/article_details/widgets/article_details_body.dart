import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/constants/colors.dart';
import 'package:news_app/constants/size_config.dart';
import 'package:news_app/models/news_response.dart';
import 'package:news_app/screens/article_details/widgets/article_details_app_bar.dart';
import 'package:news_app/screens/webview_article_screen/full_article_screen.dart';
import 'package:news_app/shared_widgets/cached_error_widget.dart';
import 'package:news_app/shared_widgets/news_article_item.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ArticleDetailsBody extends StatefulWidget {
  final Article article;
  const ArticleDetailsBody({super.key, required this.article});

  @override
  State<ArticleDetailsBody> createState() => _ArticleDetailsBodyState();
}

class _ArticleDetailsBodyState extends State<ArticleDetailsBody> {
  late final WebViewController controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (widget.article.url != null) {
      controller = WebViewController()
        ..loadRequest(Uri.parse(widget.article.url!));
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const ArticleDetailsAppBar(),
          SizedBox(
            height: 24.h,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: CachedNetworkImage(
                  errorWidget: (context, url, error) {
                    return const CachedErrorWidget();
                  },
                  // imageUrl: artilce.urlToImage!,
                  imageUrl: widget.article.urlToImage ?? "",
                  width: double.infinity,
                  height: SizeConfig.screenHeight * 0.3,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Text(
                  widget.article.author ?? "No author found",
                  style: Theme.of(context).textTheme.titleSmall,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.start,
                ),
              ),
              SizedBox(
                height: 5.h,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Text(
                  widget.article.title ?? "No Title Found found",
                  style: Theme.of(context).textTheme.titleMedium,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
              ),
              SizedBox(
                height: 5.h,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Text(
                  formatDate(
                      widget.article.publishedAt ?? DateTime.now().toString()),
                  style: Theme.of(context).textTheme.titleSmall,
                  textAlign: TextAlign.end,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              SizedBox(
                height: 25.h,
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 15),
                padding: const EdgeInsets.all(15),
                width: SizeConfig.screenWidth,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      widget.article.content!,
                      style: TextStyle(color: MyColors.darkColor, fontSize: 14),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    InkWell(
                      onTap: () {
                        if (widget.article.url != null) {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return FullArticleScreen(
                              controller: controller,
                            );
                          }));
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                  "Sorry the url for this article is invalid"),
                            ),
                          );
                        }
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            "View full article",
                            textAlign: TextAlign.end,
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w500),
                          ),
                          Icon(Icons.arrow_right)
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
