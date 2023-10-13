import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/constants/my_theme.dart';
import 'package:news_app/constants/size_config.dart';
import 'package:news_app/screens/article_details/article_details_screen.dart';
import 'package:news_app/screens/home/home_screen.dart';
import 'package:news_app/screens/search/search_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Future.delayed(const Duration(seconds: 2));
  FlutterNativeSplash.remove();

  runApp(const NewsApp());
}

class NewsApp extends StatelessWidget {
  const NewsApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return ScreenUtilInit(
      designSize: const Size(412, 870),
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'News App',
          theme: MyTheme.mainTheme,
          initialRoute: HomeScreen.routeName,
          routes: {
            HomeScreen.routeName: (context) => const HomeScreen(),
            ArticleDetailsScreen.routeName: (context) =>
                const ArticleDetailsScreen(),
            SearchScreen.routeName: (context) => const SearchScreen(),
          },
        );
      },
    );
  }
}
