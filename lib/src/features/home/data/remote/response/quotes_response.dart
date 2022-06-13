import 'dart:convert';

import '../../../../../utils/safety_generated_json.dart';

class QuotesResponse {
  const QuotesResponse({
    this.count,
    this.totalCount,
    this.page,
    this.totalPages,
    this.lastItemIndex,
    this.results,
  });

  factory QuotesResponse.fromJson(Map<String, dynamic> json) {
    final List<Quote>? results = json['results'] is List ? <Quote>[] : null;
    if (results != null) {
      for (final dynamic item in json['results']!) {
        if (item != null) {
          tryCatch(() {
            results.add(Quote.fromJson(asT<Map<String, dynamic>>(item)!));
          });
        }
      }
    }
    return QuotesResponse(
      count: asT<int?>(json['count']),
      totalCount: asT<int?>(json['totalCount']),
      page: asT<int?>(json['page']),
      totalPages: asT<int?>(json['totalPages']),
      lastItemIndex: asT<int?>(json['lastItemIndex']),
      results: results,
    );
  }

  final int? count;
  final int? totalCount;
  final int? page;
  final int? totalPages;
  final int? lastItemIndex;
  final List<Quote>? results;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'count': count,
        'totalCount': totalCount,
        'page': page,
        'totalPages': totalPages,
        'lastItemIndex': lastItemIndex,
        'results': results,
      };

  QuotesResponse copy() {
    return QuotesResponse(
      count: count,
      totalCount: totalCount,
      page: page,
      totalPages: totalPages,
      lastItemIndex: lastItemIndex,
      results: results?.map((Quote e) => e.copy()).toList(),
    );
  }
}

class Quote {
  const Quote({
    this.tags,
    this.id,
    this.author,
    this.content,
    this.authorslug,
    this.length,
    this.dateadded,
    this.datemodified,
  });

  factory Quote.fromJson(Map<String, dynamic> json) {
    final List<String>? tags = json['tags'] is List ? <String>[] : null;
    if (tags != null) {
      for (final dynamic item in json['tags']!) {
        if (item != null) {
          tryCatch(() {
            tags.add(asT<String>(item)!);
          });
        }
      }
    }
    return Quote(
      tags: tags,
      id: asT<String?>(json['_id']),
      author: asT<String?>(json['author']),
      content: asT<String?>(json['content']),
      authorslug: asT<String?>(json['authorSlug']),
      length: asT<int?>(json['length']),
      dateadded: asT<String?>(json['dateAdded']),
      datemodified: asT<String?>(json['dateModified']),
    );
  }

  final List<String>? tags;
  final String? id;
  final String? author;
  final String? content;
  final String? authorslug;
  final int? length;
  final String? dateadded;
  final String? datemodified;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'tags': tags,
        '_id': id,
        'author': author,
        'content': content,
        'authorSlug': authorslug,
        'length': length,
        'dateAdded': dateadded,
        'dateModified': datemodified,
      };

  Quote copy() {
    return Quote(
      tags: tags?.map((String e) => e).toList(),
      id: id,
      author: author,
      content: content,
      authorslug: authorslug,
      length: length,
      dateadded: dateadded,
      datemodified: datemodified,
    );
  }
}
