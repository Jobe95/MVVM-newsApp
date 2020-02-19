import 'dart:convert';

import 'package:fresh_news/models/newsArticle.dart';
import 'package:fresh_news/utils/constants.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class WebService {
  Future<List<NewsArticle>> fetchHeadlinesByKeyword(String keyword) async {
    final Response response = await http.get(Constants.headlinesFor(keyword));
    if (response.statusCode == 200) {
      final result = jsonDecode(response.body);
      Iterable list = result['articles'];
      return list.map((json) => NewsArticle.fromJSON(json)).toList();
    } else {
      throw Exception('Failed to get news by keyword');
    }
  }

  Future<List<NewsArticle>> fetchTopHeadlines() async {
    final Response response = await http.get(Constants.TOP_HEADLINES_URL);

    if (response.statusCode == 200) {
      final result = jsonDecode(response.body);
      Iterable list = result['articles'];
      return list.map((article) => NewsArticle.fromJSON(article)).toList();
    } else {
      throw Exception('Failed to get new');
    }
  }
}
