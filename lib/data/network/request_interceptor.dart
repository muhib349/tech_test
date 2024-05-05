import 'package:dio/dio.dart';
import 'package:tech_test/utils/constant.dart';

class RequestInterceptor extends InterceptorsWrapper{

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {

    options.queryParameters.addAll({apiKey: token});
    return super.onRequest(options, handler);
  }
}