import 'package:tech_test/data/network/exceptions/api_exception.dart';

class UnAuthorizeException extends ApiException {
  UnAuthorizeException(String message): super(message:  message);
}