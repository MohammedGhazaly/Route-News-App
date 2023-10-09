import 'package:flutter/material.dart';
import 'package:news_app/constants/colors.dart';

class NotOkayStatus extends StatelessWidget {
  final String message;
  const NotOkayStatus({
    super.key,
    required this.message,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          message,
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
