import 'package:tech_test/data/network/exceptions/api_exception.dart';

class NotFoundException extends ApiException{
  NotFoundException(String message): super(message: message);
}