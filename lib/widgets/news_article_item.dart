import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/constants/colors.dart';
import 'package:news_app/constants/size_config.dart';
import 'package:news_app/models/news_response.dart';
import 'package:news_app/widgets/cached_error_widget.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:intl/intl.dart';

class NewsArticleItem extends StatelessWidget {
  final Article artilce;
  const NewsArticleItem({super.key, required this.artilce});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: CachedNetworkImage(
            errorWidget: (context, url, error) {
              return const CachedErrorWidget();
            },
            // imageUrl: artilce.urlToImage!,
            imageUrl: artilce.urlToImage!,
            width: double.infinity,
            height: SizeConfig.screenHeight * 0.25,
            fit: BoxFit.cover,
          ),
          // child: FadeInImage(
          //   placeholder: MemoryImage(kTransparentImage),
          //   image: NetworkImage(artilce.urlToImage!),
          //   fit: BoxFit.cover,
          //   height: SizeConfig.screenHeight * 0.25,
          //   width: double.infinity,
          // ),
        ),
        SizedBox(
          height: 10.h,
        ),
        Text(
          artilce.author ?? "No author found",
          style: Theme.of(context).textTheme.titleSmall,
          overflow: TextOverflow.ellipsis,
        ),
        SizedBox(
          height: 5.h,
        ),
        Text(
          artilce.title ?? "No Title Found found",
          style: Theme.of(context).textTheme.titleMedium,
          overflow: TextOverflow.ellipsis,
          maxLines: 2,
        ),
        SizedBox(
          height: 5.h,
        ),
        Text(
          formatDate(artilce.publishedAt ?? DateTime.now().toString()) ??
              "No Title Found found",
          style: Theme.of(context).textTheme.titleSmall,
          textAlign: TextAlign.end,
          overflow: TextOverflow.ellipsis,
        ),
        Divider(
          color: MyColors.greyColor.withOpacity(0.25),
          thickness: 1,
        ),
        SizedBox(
          height: 15.h,
        )
      ],
    );
  }
}

String formatDate(String dateString) {
  DateTime date = DateTime.parse(dateString);
  return DateFormat.jm().format(date);
}
