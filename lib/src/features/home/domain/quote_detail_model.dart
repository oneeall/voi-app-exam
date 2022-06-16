import 'quote_extensions.dart';

/// this domain model for detail quote ui
class QuoteDetailModel {
  const QuoteDetailModel({
    required this.content,
    required this.author,
    required this.isShortQuote,
  });

  final String content;
  final String author;
  final QuoteType isShortQuote;

  /// simple function of model
  String get title => '$author - [${isShortQuote.name.toUpperCase()} Quote]';
}
