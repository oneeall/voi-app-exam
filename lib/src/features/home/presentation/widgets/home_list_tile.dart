import 'package:flutter/material.dart';
import 'package:mobile_app/src/features/home/data/quotes_response.dart';
import 'package:mobile_app/src/ui/mixins/dialog_mixin.dart';

import '../../domain/quote_extensions.dart';

class HomeListTile extends StatelessWidget with DialogMixin {
  const HomeListTile({
    Key? key,
    required this.item,
  }) : super(key: key);

  final Quote item;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(item.content ?? ''),
      onLongPress: () {
        var detailQuote = item.toQuoteDetailModel;

        showDialogCustom(
          title: detailQuote.title,
          subtitle: detailQuote.content,
        );
      },
    );
  }
}
