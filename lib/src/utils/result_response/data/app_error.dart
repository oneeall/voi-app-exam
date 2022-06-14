import 'package:flutter/foundation.dart';

enum AppErrorType {
  network,
  badRequest,
  unauthorized,
  cancel,
  timeout,
  server,
  unknown,
}

class AppError {
  late String message;
  late AppErrorType type;

  AppError(Object? error) {
    debugPrint('AppError : $error');
    type = AppErrorType.unknown;
    message = 'AppError : $error';
  }
}
