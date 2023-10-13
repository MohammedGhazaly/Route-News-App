import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class FullArticleScreen extends StatelessWidget {
  final WebViewController controller;
  const FullArticleScreen({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WebViewWidget(controller: controller),
    );
  }
}
