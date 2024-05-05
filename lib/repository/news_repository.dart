import 'package:tech_test/data/models/response/news_response.dart';
import 'package:tech_test/data/models/response/single_news_response.dart';

abstract class NewsRepository{
  Future<AllNewsResponse> getAllNews(int pageNumber);
  Future<SingleNewsResponse> getNewsById(String id);
}