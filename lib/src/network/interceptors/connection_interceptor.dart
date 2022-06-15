import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';

class ConnectionDioInterceptor extends Interceptor {
  ConnectionDioInterceptor();

  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    var connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult == ConnectivityResult.none) {
      var token = options.cancelToken;
      if (token != null) {
        token.cancel('cancelled');
      }
    }

    super.onRequest(options, handler);
  }
}
