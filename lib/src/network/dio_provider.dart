import 'package:dio/dio.dart';
import 'package:dio_smart_retry/dio_smart_retry.dart';
import 'package:flutter/foundation.dart';
import 'package:mobile_app/src/network/endpoints.dart';
import 'package:mobile_app/src/network/interceptors/log_interceptor.dart';

import 'interceptors/connection_interceptor.dart';
import 'interceptors/header_interceptor.dart';
import 'interceptors/token_expired_interceptor.dart';

// mixin RestClient {
//   static final _dio = Dio(_baseOptions);
//
//   static final _baseOptions = BaseOptions(
//     baseUrl: kDebugMode ? Endpoints.baseUrl : Endpoints.baseUrlDev,
//   );
//
//   Dio get restClient => _dio..initInterceptors(_dio);
// }
//
extension on Dio {
  void initInterceptors(Dio dio) {
    interceptors
      ..add(headerInterceptor())
      ..add(ConnectionDioInterceptor())
      ..add(RetryInterceptor(dio: dio, retries: 5))
      ..add(tokenExpiredInterceptor())
      ..add(PrettyDioLogger());
  }
}

class ApiProvider {
  static final _dio = Dio(_baseOptions);

  static final _baseOptions = BaseOptions(
    baseUrl: kDebugMode ? Endpoints.baseUrl : Endpoints.baseUrlDev,
  );

  static void init() {
    _dio.initInterceptors(_dio);
  }

  Dio get dioClient {
    return _dio;
  }
}
