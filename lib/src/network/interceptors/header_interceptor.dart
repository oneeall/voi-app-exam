import 'dart:io';

import 'package:dio/dio.dart';

InterceptorsWrapper headerInterceptor() {
  return InterceptorsWrapper(
    onRequest: (optionRequest, handler) {
      CancelToken token = CancelToken();
      optionRequest.cancelToken = token;
      optionRequest.headers[HttpHeaders.acceptHeader] = ContentType.json;
      return handler.next(optionRequest);
    },
    onResponse: (e, handler) {
      return handler.next(e);
    },
  );
}
