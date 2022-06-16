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
      {required this.code,
      required this.message,
      required this.data,
      required this.errors,
      required this.serverTime});

  final String code;
  final String message;
  final T? data;
  final List<String>? errors;
  final int serverTime;

  factory ResultResponse.fromJson(Map<String, dynamic> jsonRes) {
    final errors = jsonRes['errors'] is List ? <String>[] : null;
    if (errors != null) {
      for (final item in jsonRes['errors']!) {
        if (asT<String>(item) != null) {
          errors.add(item);
        }
      }
      _loggerOnError(errors);
    }

    final data = JsonConvert.fromJson(jsonRes['data']);

    return ResultResponse(
        code: jsonRes['code'],
        message: jsonRes['message'],
        errors: errors,
        serverTime: jsonRes['server_time'],
        data: data);
  }

  static void _loggerOnError(List<String> errors) {
    logger.w(errors);
  }
}
