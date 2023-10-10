import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/constants/colors.dart';
import 'package:news_app/constants/size_config.dart';
import 'package:news_app/models/news_response.dart';
import 'package:news_app/screens/home/widgets/home_custom_app_bar.dart';
import 'package:news_app/widgets/cached_error_widget.dart';
import 'package:news_app/widgets/news_article_item.dart';

class ArticleDetailsBody extends StatelessWidget {
  final Article article;
  const ArticleDetailsBody({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const HomeAppBar(),
          SizedBox(
            height: 24.h,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Hero(
                tag: "image",
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: CachedNetworkImage(
                    errorWidget: (context, url, error) {
                      return const CachedErrorWidget();
                    },
                    // imageUrl: artilce.urlToImage!,
                    imageUrl: article.urlToImage!,
                    width: double.infinity,
                    height: SizeConfig.screenHeight * 0.3,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Text(
                  article.author ?? "No author found",
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
                  article.title ?? "No Title Found found",
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
                  formatDate(article.publishedAt ?? DateTime.now().toString()),
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
                      article.content!,
                      style: TextStyle(color: MyColors.darkColor, fontSize: 14),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    InkWell(
                      onTap: () {},
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
