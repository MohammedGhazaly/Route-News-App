import 'package:flutter/material.dart';

class BackgroundImageOverlay extends StatelessWidget {
  final Widget widget;
  const BackgroundImageOverlay({
    super.key,
    required this.widget,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints.expand(),
      decoration: BoxDecoration(
        color: Colors.white,
        image: DecorationImage(
            opacity: 0.075,
            image: AssetImage(
              "assets/images/pattern.png",
            ),
            fit: BoxFit.cover),
      ),
    );
  }
}
