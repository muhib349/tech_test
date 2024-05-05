class ApiException implements Exception {
  final int statusCode;
  final String message;

  ApiException({
    this.statusCode = 0,
    required this.message
  });
}