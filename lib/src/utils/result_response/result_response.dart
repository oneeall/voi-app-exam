import '../logger/logger.dart';
import 'json_convert.dart';

T? asT<T>(dynamic value) {
  if (value is T) {
    return value;
  }
  return null;
}

class ResultResponse<T> {
  ResultResponse(
      {this.code, this.message, this.data, this.errors, this.serverTime});

  final String? code;
  final String? message;
  final T? data;
  final List<String>? errors;
  final int? serverTime;

  factory ResultResponse.fromJson(Map<String, dynamic> jsonRes) {
    final errors = jsonRes['errors'] is List ? <String>[] : null;
    T? data;

    try {
      if (errors != null) {
        for (final item in jsonRes['errors']!) {
          if (asT<String>(item) != null) {
            errors.add(item);
          } else {
            logger.w("WARNING: Failed to convert error to String");
          }
        }
        _loggerOnError(errors);
      }

      data = JsonConvert.fromJson<T>(jsonRes['data']);
    } catch (_) {
      logger.w("ERROR: Failed to convert ResultResponse to JSON");
    }

    return ResultResponse(
        code: asT<String>(jsonRes['code']),
        message: asT<String>(jsonRes['message']),
        errors: asT<List<String>>(errors),
        serverTime: asT<int>(jsonRes['server_time']),
        data: asT<T>(data));
  }

  static void _loggerOnError(List<String> errors) {
    logger.w(errors);
  }
}
