class QuotesQueryParams {
  final int page;

  QuotesQueryParams({required this.page});

  Map<String, dynamic> toMap() {
    return {'page': page};
  }
}
