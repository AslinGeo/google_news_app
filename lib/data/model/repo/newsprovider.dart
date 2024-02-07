import 'package:dio/dio.dart';
import 'package:google_news_app/data/model/news.dart';

class NewsProvider {
  // static const String apiKey = "AIzaSyB-lO9PolYJN55f_JpawdQMYSrB1CBu2sk";
  static const String apiKey = "153a5833395d44d3a4e25b758b9f9b93";

  Future<List<News>> fetchNewsArticles() async {
    // Replace with your Google News API key
    String url =
        'https://newsapi.org/v2/top-headlines?country=us&apiKey=$apiKey';

    try {
      final response = await Dio().get(url);
      if (response.statusCode == 200) {
        final List<dynamic> articlesJson = response.data['articles'];

        // Convert JSON to list of Article objects
        List<News> articles = articlesJson.map((articleJson) {
          return News.fromJson(articleJson);
        }).toList();

        return articles;
      } else {
        throw Exception('Failed to load news articles');
      }
    } catch (e) {
      throw Exception('Failed to load news articles: $e');
    }
  }
}
