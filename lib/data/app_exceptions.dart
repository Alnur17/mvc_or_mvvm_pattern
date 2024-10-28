class AppExceptions implements Exception {
  final String? _message;
  final String? _prefix;

  AppExceptions(this._message, this._prefix);

  @override
  String toString() {
    return '$_prefix$_message';
  }
}

class InternetException extends AppExceptions {
  InternetException(String? message) : super(message, 'No Internet');
}

class RequestTimeOut extends AppExceptions {
  RequestTimeOut(String? message) : super(message, 'Request time out');
}

class SeverException extends AppExceptions {
  SeverException(String? message) : super(message, 'Internal server error');
}

class InvalidUrlException extends AppExceptions {
  InvalidUrlException(String? message) : super(message, 'Invalid url');
}

class FetchDataException extends AppExceptions {
  FetchDataException(String? message) : super(message, '');
}
