import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:tech_test/data/network/request_interceptor.dart';
import 'package:tech_test/utils/constant.dart';

class Api {
  final dio = createDio();

  Api._internal();

  static final _singleton = Api._internal();

  factory Api() => _singleton;

  static final baseOption = BaseOptions(
  baseUrl: baseURL,
  receiveTimeout: const Duration(milliseconds: 15000),
  connectTimeout: const Duration(milliseconds: 15000),
  );

  static Dio createDio() {
    var dio = Dio(
      baseOption,
    );
    dio.interceptors.add(RequestInterceptor());

    if(!kReleaseMode){
      dio.interceptors.add(PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: false,
        compact: false,
      ));
    }
    return dio;
  }

}