import 'package:dio/dio.dart';
import 'package:dio/native_imp.dart';
import 'package:mobile_app/src/network/interceptors/log_interceptor.dart';

class RestClient extends DioForNative {
  static final _baseOptionsDev = BaseOptions(
    baseUrl: 'http://api.quotable.io',
  );
  RestClient() : super(_baseOptionsDev) {
    interceptors.addAll([PrettyDioLogger()]);
  }

  RestClient auth() {
    options.extra['auth_required'] = true;
    return this;
  }
}
