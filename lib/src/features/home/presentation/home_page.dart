import 'package:flutter/material.dart';

import '../../../../main.dart';
import 'widgets/home_body.dart';
import 'widgets/home_bottom_loading.dart';
import 'widgets/home_floating_action_button.dart';
import 'widgets/home_app_bar.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: MyApp.myAppScaffoldKey,
      appBar: const HomeAppBar(),
      body: const HomeBody(),
      bottomNavigationBar: const HomeBottomLoading(),
      floatingActionButton: const HomeFloatingActionButton(),
    );
  }
}
