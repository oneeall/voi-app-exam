import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

// enum AppErrorType {
//   network,
//   badRequest,
//   unauthorized,
//   cancel,
//   timeout,
//   server,
//   unknown,
// }

class AppError {
  late String message;
  late DioErrorType type;

  AppError(Object? error) {
    debugPrint('AppError : $error');
    type = DioErrorType.other;
    message = 'AppError : $error';
  }
}
