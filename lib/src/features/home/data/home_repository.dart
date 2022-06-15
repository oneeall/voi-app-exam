import 'package:mobile_app/src/features/home/data/quotes_response.dart';
import 'package:mobile_app/src/network/dio_provider.dart';

import '../../../utils/logger/logger.dart';

class HomeRepository {
  Future<QuotesResponse?> obtainQuotes({int page = 1}) async {
    try {
      final restClient = RestClient();
      var response = await restClient.get(
        '/quotes',
        queryParameters: {
          'page': page,
        },
      );

      return QuotesResponse.fromJson(response.data);
    } catch (e) {
      logger.w('error on get /quotes');
    }

    return null;
  }
}
