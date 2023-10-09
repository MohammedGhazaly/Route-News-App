import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_app/constants/api_constants.dart';
import 'package:news_app/models/news_response.dart';
import 'package:news_app/models/sources_response.dart';

class ApiServices {
  //https://newsapi.org/v2/top-headlines/sources?apiKey=92c91222acf140e9a11206b6fa65d2f9
  static Future<SourcesResponse> getSources() async {
    try {
      Uri url = Uri.https(ApiConstants.baseUrl, ApiConstants.sourceEndpoint, {
        "apiKey": ApiConstants.apiKey,
      });
      var response = await http.get(url);
      Map<String, dynamic> jsonData = jsonDecode(response.body);
      SourcesResponse responseData = SourcesResponse.fromJson(jsonData);

      return responseData;
    } on Exception catch (e) {
      throw e;
    }
  }

  static Future<NewsResponse> getNewsBySourceId(
      {required String sourceId}) async {
    try {
      Uri url = Uri.https(ApiConstants.baseUrl, ApiConstants.newsEndpoint, {
        "apiKey": ApiConstants.apiKey,
        "sources": sourceId,
      });
      var response = await http.get(url);
      Map<String, dynamic> jsonData = jsonDecode(response.body);
      NewsResponse responseData = NewsResponse.fromJson(jsonData);

      return responseData;
    } on Exception catch (e) {
      throw e;
    }
  }
}
