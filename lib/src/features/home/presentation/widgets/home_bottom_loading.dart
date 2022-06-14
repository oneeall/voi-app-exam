import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../view_model/home_view_model.dart';

class HomeBottomLoading extends StatelessWidget {
  const HomeBottomLoading({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var isLoading =
        context.select<HomeViewModel, bool>((value) => value.bottomLoading);
    return Visibility(
      visible: isLoading,
      child: const SizedBox(
          height: kToolbarHeight,
          width: double.infinity,
          child: Center(
            child: CircularProgressIndicator(),
          )),
    );
  }
}
