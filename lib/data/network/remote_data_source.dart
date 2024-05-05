import 'package:dio/dio.dart';
import 'package:tech_test/data/models/response/news_response.dart';
import 'package:tech_test/data/models/response/single_news_response.dart';
import 'package:tech_test/data/network/base_remote_data_source.dart';

class RemoteDataSource extends BaseRemoteDataSource{
  final Dio _dioClient;

  RemoteDataSource(this._dioClient);

  Future<AllNewsResponse> getAllNewsData(int pageNumber) async {
    try{
      var request = _dioClient.get("/search", queryParameters: {'page': pageNumber});
      return makeRequest(request).then((response) => AllNewsResponse.fromJson(response.data));
    }catch (e)  {
      rethrow;
    }
  }


  Future<SingleNewsResponse> getNewsById(String id){
    try{
      var request = _dioClient.get("/$id");
      return makeRequest(request).then((response) => SingleNewsResponse.fromJson(response.data));
    }catch (e)  {
      rethrow;
    }
  }

}