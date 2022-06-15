import '../data/quotes_response.dart';
import 'quote_detail_model.dart';

/// example for extensions classes

/// constant
const longQuoteLength = 60;

enum QuoteType { short, long }

extension QuoteDetail on Quote {
  /// example of mapping data model from data layer to model in domain layer
  QuoteDetailModel get toQuoteDetailModel {
    var body = content ?? 'no content';
    var title = author ?? 'unknown author';
    var isShortQuote = _checkLengthQuote(length ?? 0);

    return QuoteDetailModel(
      author: title,
      content: body,
      isShortQuote: isShortQuote,
    );
  }

  /// function logic for checking quote type (short or long quote)
  QuoteType _checkLengthQuote(int length) =>
      length > longQuoteLength ? QuoteType.long : QuoteType.short;
}
