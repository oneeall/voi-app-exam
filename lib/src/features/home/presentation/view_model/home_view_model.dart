import 'package:flutter/material.dart';
import 'package:mobile_app/src/features/home/domain/home_model.dart';
import 'package:mobile_app/src/utils/result_response/data/app_error.dart';
import 'package:mobile_app/src/utils/result_response/result_response_mixin.dart';

import '../../data/home_repository.dart';

class HomeViewModel with ChangeNotifier, ResultResponseMixin<HomeModel?> {
  HomeViewModel({
    required this.homeRepository,
  });

  final HomeRepository homeRepository;

  Future<void> fetchQuotes() async {
    /// show loading / shimmer
    showLoadingState();
    try {
      /// obtain the data from repo
      var quotesResponse = await homeRepository.obtainQuotes();
      var results = quotesResponse.results;

      /// Compose data domain
      HomeModel? homeModel =
          results != null ? HomeModel(quotes: results) : null;

      /// show results
      showResultState(data: homeModel);
    } catch (e) {
      /// log something went wrong
      debugPrint(e.toString());
      showErrorState(error: AppError(e));
    }
  }
}
