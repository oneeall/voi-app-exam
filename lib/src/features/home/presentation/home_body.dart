import 'package:flutter/material.dart';
import 'package:mobile_app/src/features/home/domain/home_model.dart';
import 'package:mobile_app/src/utils/result_response/result_response_builder.dart';
import 'package:provider/provider.dart';

import 'view_model/home_view_model.dart';
import 'widgets/home_list_tile.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResultResponseBuilder<HomeModel>(
      response: context.watch<HomeViewModel>().responseState,
      whenLoading: const Center(
        child: CircularProgressIndicator(),
      ),
      whenDataNull: const Center(
        child: Text('data not found'),
      ),
      whenSuccess: (homeModel) => ListView.builder(
        itemBuilder: (context, index) =>
            HomeListTile(item: homeModel.quotes[index]),
        itemCount: homeModel.quotes.length,
      ),
      whenError: (app, e) => const Center(
        child: Text('data error'),
      ),
    );
  }
}
