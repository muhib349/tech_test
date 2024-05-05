import 'dart:io';

import 'package:dio/dio.dart';
import 'package:tech_test/data/network/exceptions/api_exception.dart';
import 'package:tech_test/data/network/exceptions/app_exception.dart';
import 'package:tech_test/data/network/exceptions/bad_request_exception.dart';
import 'package:tech_test/data/network/exceptions/network_exception.dart';
import 'package:tech_test/data/network/exceptions/not_found_exception.dart';
import 'package:tech_test/data/network/exceptions/service_unavailable_exception.dart';
import 'package:tech_test/data/network/exceptions/unauthorize_exception.dart';

Exception handleDioException(DioException dioException){
  switch(dioException.type){
    case DioExceptionType.connectionError:
      return AppException(message: "No internet! Connection issue.");
    case DioExceptionType.connectionTimeout:
      return AppException(message: "No internet! Connection issue.");
    case DioExceptionType.receiveTimeout:
      return NetworkException(message: "Receive timeout in connection with API server!");
    case DioExceptionType.sendTimeout:
      return NetworkException(message: "Send timeout in connection with API server!");
    case DioExceptionType.badCertificate:
      return AppException(message: "Invalid Certificate");
    case DioExceptionType.badResponse:
      return _parseBadResponse(dioException);
    case DioExceptionType.cancel:
      return AppException(message: "Request Cancel!");
    case DioExceptionType.unknown:
      return AppException(message: "Something went wrong!");
  }
}

Exception _parseBadResponse(DioException dioException){
  int statusCode = dioException.response?.statusCode ?? -1;


  switch(statusCode){
    case HttpStatus.serviceUnavailable:
      return ServiceUnavailableException("Service unavailable!");
    case HttpStatus.notFound:
      return NotFoundException("Resource not found!");
    case HttpStatus.badRequest:
      return BadRequestException("Bad request!");
    case HttpStatus.unauthorized:
      return UnAuthorizeException("UnAuthorize request!");
    default:
      return ApiException(
        message: "Something went wrong!",
        statusCode: statusCode,
      );
  }
}