import 'package:flutter/material.dart';

import '../../../../main.dart';
import 'home_body.dart';
import 'home_floating_action_button.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: MyApp.myAppScaffoldKey,
      appBar: AppBar(
        title: const Text('home'),
      ),
      body: const HomeBody(),
      floatingActionButton: const HomeFloatingActionButton(),
    );
  }
}
