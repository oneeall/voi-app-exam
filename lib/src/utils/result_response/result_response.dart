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
            logger
                .w("WARNING: Failed to convert error on errors list to String");
          }
        }
        _loggerOnError(errors);
      }

      data = JsonConvert.fromJson<T>(jsonRes['data']);
    } catch (_) {
      logger.w("ERROR: Failed to convert ResultResponse to JSON");
    }

    return ResultResponse(
        code: _asTLogger<String>(jsonRes['code'], 'code'),
        message: _asTLogger<String>(jsonRes['message'], 'message'),
        errors: _asTLogger<List<String>>(errors, 'errors'),
        serverTime: _asTLogger<int>(jsonRes['server_time'], 'server_time'),
        data: _asTLogger<T>(data, 'data'));
  }

  static void _loggerOnError(List<String> errors) {
    logger.w(errors);
  }

  static T? _asTLogger<T>(dynamic value, String key) {
    if (value is T) {
      return value;
    }
    logger.w('WARNING: wrong value assigned to $key');

    return null;
  }
}
