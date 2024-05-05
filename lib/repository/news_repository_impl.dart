

import 'package:tech_test/data/models/response/news_response.dart';
import 'package:tech_test/data/models/response/single_news_response.dart';
import 'package:tech_test/data/network/api.dart';
import 'package:tech_test/data/network/remote_data_source.dart';
import 'package:tech_test/repository/news_repository.dart';

class NewsRepositoryImpl implements NewsRepository{
  final RemoteDataSource dataSource;
  NewsRepositoryImpl(this.dataSource);

  @override
  Future<AllNewsResponse> getAllNews(int pageNumber) {
    return dataSource.getAllNewsData(pageNumber);
  }

  @override
  Future<SingleNewsResponse> getNewsById(String id) {
    return dataSource.getNewsById(id);
  }


}