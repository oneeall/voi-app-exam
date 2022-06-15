import 'package:dio/dio.dart';
import 'package:dio/native_imp.dart';
import 'package:dio_smart_retry/dio_smart_retry.dart';
import 'package:mobile_app/src/network/interceptors/log_interceptor.dart';

import 'interceptors/connection_interceptor.dart';
import 'interceptors/header_interceptor.dart';
import 'interceptors/token_expired_interceptor.dart';

class RestClient extends DioForNative {
  static final _dio = Dio();

  static Dio get dio {
    return _dio;
  }

  static final _baseOptionsDev = BaseOptions(
    baseUrl: 'http://api.quotable.io',
  );

  RestClient() : super(_baseOptionsDev) {
    interceptors
      ..add(headerInterceptor())
      ..add(ConnectionDioInterceptor())
      ..add(RetryInterceptor(dio: dio, retries: 5))
      ..add(tokenExpiredInterceptor())
      ..add(PrettyDioLogger());
  }

  RestClient auth() {
    options.extra['auth_required'] = true;
    return this;
  }
}
