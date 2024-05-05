import 'package:tech_test/data/network/exceptions/api_exception.dart';

class BadRequestException extends ApiException{
  BadRequestException(String message):super(message:  message);
}