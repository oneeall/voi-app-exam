import 'package:mobile_app/src/features/home/data/quotes_query_params.dart';
import 'package:mobile_app/src/features/home/data/quotes_response.dart';
import 'package:mobile_app/src/features/products/data/products_response.dart';
import 'package:mobile_app/src/features/user/data/user_response.dart';
import 'package:mobile_app/src/network/dio_provider.dart';
import 'package:mobile_app/src/network/endpoints.dart';
import 'package:mobile_app/src/utils/result_response/result_response.dart';

import '../../../utils/logger/logger.dart';

class HomeRepository with ApiProvider {
  Future<ResultResponse<QuotesResponse>?> obtainQuotes({
    required QuotesQueryParams queryParams,
  }) async {
    try {
      var response = await dioClient.get(
        Endpoints.quotesPath,
        queryParameters: queryParams.toMap(),
      );
      return ResultResponse<QuotesResponse>.fromJson(response.data);
    } catch (e) {
      logger.w('error on get ${Endpoints.quotesPath}');
    }

    return null;
  }

  void getPrduct() {
    var product = Product();
  }

  void getUser() {
    var user = UserResponse('');
  }
}
