import 'package:mobile_app/src/features/home/data/remote/quotes_response.dart';

class HomeModel {
  const HomeModel({
    required this.quotes,
    this.page,
  });

  final List<Quote> quotes;
  final int? page;

  int get quotesLength => quotes.length;
}
