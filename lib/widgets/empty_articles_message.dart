import 'package:flutter/material.dart';
import 'package:news_app/constants/colors.dart';

class EmptyArticlesMessage extends StatelessWidget {
  const EmptyArticlesMessage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          "There isn't news matching your search",
          textAlign: TextAlign.center,
          style: TextStyle(
            color: MyColors.blackColor,
            fontSize: 32,
          ),
        ),
      ],
    );
  }
}
