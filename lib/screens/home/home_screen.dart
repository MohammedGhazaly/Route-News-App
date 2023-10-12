import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/screens/category/widgets/category_listview.dart';
import 'package:news_app/screens/home/widgets/home_custom_app_bar.dart';
import 'package:news_app/shared_widgets/background_image_overlay.dart';
import 'package:news_app/shared_widgets/home_drawer.dart';

class HomeScreen extends StatefulWidget {
  static String routeName = "home-screen";
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> _key = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return BackgroundImageOverlay(
      widget: Scaffold(
        key: _key,
        drawer: const Drawer(
          child: HomeDrawer(),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            HomeAppBar(openDrawer: () {
              _key.currentState!.openDrawer();
            }),
            SizedBox(
              height: 24.h,
            ),
            Expanded(child: CategoriesListView())
            // const Expanded(child: NewsAgenciesTabs()),
          ],
        ),
      ),
    );
  }
}
