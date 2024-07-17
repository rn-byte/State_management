// ignore_for_file: prefer_typing_uninitialized_variables

class AppExceptions implements Exception {
  final _message;
  final _prefix;
  AppExceptions([this._message, this._prefix]);

  @override
  String toString() {
    return '$_message $_prefix';
  }
}

class NoInternetException extends AppExceptions {
  NoInternetException([String? message])
      : super(message, 'No Internet Connection');
}

class UnauthorizedException extends AppExceptions {
  UnauthorizedException([String? message])
      : super(message, 'Unauthorized access');
}

class RequestTimeout extends AppExceptions {
  RequestTimeout([String? message]) : super(message, 'Request Timeout');
}

class FetchDataException extends AppExceptions {
  FetchDataException([String? message]) : super(message, '');
}
