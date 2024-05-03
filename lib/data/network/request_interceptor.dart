import 'package:dio/dio.dart';

class RequestInterceptor extends InterceptorsWrapper{

  final String token = "c6137b1f-04d1-406d-9dcd-0f3214026a6a";

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {

    options.queryParameters.addAll({'api-key': token});
    return super.onRequest(options, handler);
  }
}