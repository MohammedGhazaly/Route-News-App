import 'package:flutter/material.dart';
import 'package:news_app/screens/home/widgets/home_body.dart';
import 'package:news_app/widgets/background_image_overlay.dart';

class HomeScreen extends StatelessWidget {
  static String routeName = "home-screen";
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const BackgroundImageOverlay(
      widget: Scaffold(
        body: HomeBody(),
      ),
    );
  }
}
