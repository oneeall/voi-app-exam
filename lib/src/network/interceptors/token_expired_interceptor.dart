import 'package:dio/dio.dart';

InterceptorsWrapper tokenExpiredInterceptor() {
  return InterceptorsWrapper(
    onResponse: (e, handler) {
      return handler.next(e);
    },
  );
}
