import 'package:flutter/material.dart';
import 'package:mobile_app/src/features/home/domain/home_model.dart';
import 'package:mobile_app/src/utils/result_response/result_response_builder.dart';
import 'package:mobile_app/src/utils/result_response/result_response_state.dart';
import 'package:provider/provider.dart';

import '../view_model/home_view_model.dart';
import 'home_list_tile.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResultResponseBuilder<HomeModel>(
      response: context.select<HomeViewModel, ResultResponseState<HomeModel?>?>(
          (value) => value.responseState),
      whenLoading: const Center(
        child: CircularProgressIndicator(),
      ),
      whenDataNull: const Center(
        child: Text('data not found'),
      ),
      whenSuccess: (_) => const HomeQuotesSection(),
      whenError: (app, e) => const Center(
        child: Text('data error'),
      ),
    );
  }
}

class HomeQuotesSection extends StatelessWidget {
  const HomeQuotesSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var homeModel =
        context.select<HomeViewModel, HomeModel?>((value) => value.homeModel);
    return homeModel != null
        ? ListView.builder(
            itemBuilder: (context, index) =>
                HomeListTile(item: homeModel.quotes[index]),
            itemCount: homeModel.quotesLength,
          )
        : const Center(
            child: Text('data not found'),
          );
  }
}
