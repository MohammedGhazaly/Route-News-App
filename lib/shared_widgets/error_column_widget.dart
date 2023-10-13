import 'package:flutter/material.dart';
import 'package:news_app/constants/colors.dart';
import 'package:news_app/shared_widgets/not_okay_status.dart';

class ErrorColumnWidget extends StatelessWidget {
  final String errorMessage;
  final void Function()? onPressed;
  const ErrorColumnWidget({
    super.key,
    required this.errorMessage,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        NotOkayStatus(
          message: errorMessage,
        ),
        Icon(
          Icons.wifi_off,
          color: MyColors.darkColor,
        ),
        ElevatedButton.icon(
            style: ElevatedButton.styleFrom(
              backgroundColor: MyColors.primaryColor,
              foregroundColor: MyColors.whiteColor,
            ),
            onPressed: onPressed,
            icon: const Icon(Icons.restart_alt),
            label: const Text("Try again"))
      ],
    );
  }
}
