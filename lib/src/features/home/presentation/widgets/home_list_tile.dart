import 'package:flutter/material.dart';
import 'package:mobile_app/src/features/home/data/remote/quotes_response.dart';

class HomeListTile extends StatelessWidget {
  const HomeListTile({
    Key? key,
    required this.item,
  }) : super(key: key);

  final Quote item;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(item.content ?? ''),
    );
  }
}
