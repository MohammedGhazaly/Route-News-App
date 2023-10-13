import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/models/category_model.dart';
import 'package:news_app/screens/category/widgets/category_custom_app_bar.dart';
import 'package:news_app/screens/category/widgets/category_listview.dart';
import 'package:news_app/screens/home/widgets/home_custom_app_bar.dart';
import 'package:news_app/screens/home/widgets/news_agencies_tabs.dart';
import 'package:news_app/shared_widgets/background_image_overlay.dart';
import 'package:news_app/shared_widgets/home_drawer.dart';

class HomeScreen extends StatefulWidget {
  static String routeName = "home-screen";
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  CategoryModel? categoryModel;
  final GlobalKey<ScaffoldState> _key = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return BackgroundImageOverlay(
      widget: Scaffold(
        key: _key,
        drawer: Drawer(
          child: HomeDrawer(onSideMenuClicked: () {
            setState(() {
              categoryModel = null;
            });
            Navigator.pop(context);
          }),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            if (categoryModel == null) const CategoryCustomAppBar(),
            if (categoryModel != null)
              HomeAppBar(
                  selectedCategory: categoryModel!.title,
                  openDrawer: () {
                    _key.currentState!.openDrawer();
                  }),
            SizedBox(
              height: 24.h,
            ),
            if (categoryModel == null)
              Expanded(child: CategoriesListView(
                onCategoryClick: (newSelectedCategoryModel) {
                  setState(() {});
                  categoryModel = newSelectedCategoryModel;
                },
              )),
            if (categoryModel != null)
              Expanded(
                  child: NewsAgenciesTabs(
                categoryModel: categoryModel!,
              )),
          ],
        ),
      ),
    );
  }
}
