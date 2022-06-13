import 'package:flutter/material.dart';
import 'package:mobile_app/src/features/home/data/remote/response/quotes_response.dart';

import '../../data/home_repository.dart';

class HomeViewModel with ChangeNotifier {
  HomeViewModel({
    required this.homeRepository,
  });

  final HomeRepository homeRepository;

  List<Quote> _quotes = [];

  List<Quote> get quotes => _quotes;

  Future<void> fetchQuotes() async {
    try {
      var quotesResponse = await homeRepository.obtainQuotes();
      var results = quotesResponse.results;
      // var page = quotesResponse.page;
      // var totalpages = quotesResponse.totalpages;

      if (results != null) {
        _quotes = results;
        notifyListeners();
      }
    } catch (e) {
      /// log something went wrong
      debugPrint(e.toString());
    }
  }
}
