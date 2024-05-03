

import 'package:tech_test/data/models/response/news_response.dart';
import 'package:tech_test/data/models/response/single_news_response.dart';
import 'package:tech_test/data/network/api.dart';

class NewsRepository{

  Future<AllNewsResponse> getNews(int pageNumber) async {
    var response = await Api().dio.get("/search", queryParameters: {'page': pageNumber});
    return AllNewsResponse.fromJson(response.data);
  }

  Future<SingleNewsResponse> getNewsById(String id) async {
    var response = await Api().dio.get("/$id");
    return SingleNewsResponse.fromJson(response.data);
  }
}