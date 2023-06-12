class HttpException implements Exception {
  final String? _message;
  final int? _code;

  String get message => _message ?? runtimeType.toString();
  int get code => _code ?? -1;

  HttpException([String? message, int? code])
      : _message = message,
        _code = code;
}

class BadRequestException extends HttpException {
  BadRequestException({String? message, int? code}) : super(message, code);
}

class BadResponseException extends HttpException {
  BadResponseException({String? message, int? code}) : super(message, code);
}

class NetWorkException extends HttpException {
  NetWorkException({String? message, int? code}) : super(message, code);
}

class UnknownException extends HttpException {
  UnknownException({String? message}) : super(message);
}

class CancelRequestException extends HttpException {
  CancelRequestException({String? message}) : super(message);
}

class UnauthorizedException extends HttpException {
  UnauthorizedException({String? message, int? code}) : super(message, code);
}

class BadServiceException extends HttpException {
  BadServiceException({String? message, int? code}) : super(message, code);
}