import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'view_model/home_view_model.dart';
import 'widgets/home_list_tile.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var listOfQuotes = context.watch<HomeViewModel>().quotes;

    return ListView.builder(
      itemBuilder: (context, index) => HomeListTile(item: listOfQuotes[index]),
      itemCount: listOfQuotes.length,
    );
  }
}
