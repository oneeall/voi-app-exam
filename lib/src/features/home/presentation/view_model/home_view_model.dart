import 'package:flutter/material.dart';
import 'package:mobile_app/src/features/home/data/quotes_response.dart';
import 'package:mobile_app/src/features/home/domain/home_model.dart';
import 'package:mobile_app/src/utils/result_response/data/app_error.dart';
import 'package:mobile_app/src/utils/result_response/result_response_mixin.dart';

import '../../data/home_repository.dart';

class HomeViewModel with ChangeNotifier, ResultResponseMixin<HomeModel?> {
  HomeViewModel({
    required this.homeRepository,
  });

  final HomeRepository homeRepository;

  bool _bottomLoading = false;

  bool get bottomLoading => _bottomLoading;

  void showBottomLoading() {
    _bottomLoading = true;
    notifyListeners();
  }

  void hideBottomLoading() {
    _bottomLoading = false;
    notifyListeners();
  }

  /// domain
  HomeModel? _homeModel;

  HomeModel? get homeModel => _homeModel;

  Future<void> loadNextQuotes() async {
    /// loading state
    showBottomLoading();

    var currentPage = _homeModel?.page ?? 1;
    var nextPage = currentPage + 1;

    var quotesResponse = await homeRepository.obtainQuotes(page: nextPage);
    var results = quotesResponse.results;
    var page = quotesResponse.page;

    /// add all list dummy
    var collectQuotes = _homeModel?.quotes;
    var cumulateQuotes = <Quote>[...?collectQuotes, ...?results];

    /// compose & set data
    _homeModel = HomeModel(quotes: cumulateQuotes, page: page);

    /// dummy delay
    await Future.delayed(const Duration(milliseconds: 350));
    hideBottomLoading();
  }

  Future<void> fetchQuotes() async {
    /// show loading / shimmer
    showLoadingState();
    try {
      /// obtain the data from repo
      var quotesResponse = await homeRepository.obtainQuotes();
      var results = quotesResponse.results;
      var page = quotesResponse.page;

      /// Compose & set data domain
      _homeModel = (results != null && page != null)
          ? HomeModel(
              quotes: results,
              page: page,
            )
          : null;

      /// show results
      showResultState(data: _homeModel);
    } catch (e) {
      /// log something went wrong
      debugPrint(e.toString());
      showErrorState(error: AppError(e));
    }
  }
}
