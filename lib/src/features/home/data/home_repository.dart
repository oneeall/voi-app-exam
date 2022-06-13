import 'package:mobile_app/src/network/dio_provider.dart';
import 'package:mobile_app/src/features/home/data/remote/response/quotes_response.dart';

class HomeRepository {
  Future<QuotesResponse> obtainQuotes() async {
    try {
      final restClient = RestClient();
      var response = await restClient.get('/quotes');

      return QuotesResponse.fromJson(response.data);
    } catch (e) {
      rethrow;
    }
  }
}
