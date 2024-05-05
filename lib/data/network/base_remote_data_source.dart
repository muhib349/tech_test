import 'package:dio/dio.dart';
import 'package:tech_test/data/network/error_handlers.dart';

class BaseRemoteDataSource {

  Future<Response<T>> makeRequest<T>(Future<Response<T>> request) async {
    try{
      Response<T> response = await request;

      return response;
    }on DioException catch(e){
     var exception = handleDioException(e);
     throw exception;
    }catch(exception){
      rethrow;
    }

  }

}