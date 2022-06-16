import '../../features/home/data/quotes_response.dart';

class JsonConvert {
  static T? fromJson<T>(Map<String, dynamic>? json) {
    if (json == null) return null;
    switch (T) {
      case QuotesResponse:
        return QuotesResponse.fromJson(json) as T;
    }
    return null;
  }
}
