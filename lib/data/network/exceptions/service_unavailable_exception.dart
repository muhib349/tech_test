import 'package:tech_test/data/network/exceptions/api_exception.dart';

class ServiceUnavailableException extends ApiException{
  ServiceUnavailableException(String message): super(message: message);
}