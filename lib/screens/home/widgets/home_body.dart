import 'package:flutter/material.dart';
import 'package:news_app/widgets/custom_app_bar.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomAppBar(),
      ],
    );
  }
}
