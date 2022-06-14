import 'package:flutter/material.dart';
import 'package:mobile_app/src/features/home/presentation/view_model/home_view_model.dart';
import 'package:provider/provider.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text('home'),
      actions: [
        IconButton(
          tooltip: 'refresh data',
          onPressed: () {
            context.read<HomeViewModel>().fetchQuotes();
          },
          icon: const Icon(Icons.refresh),
        ),
        IconButton(
          tooltip: 'load data bottom',
          onPressed: () {
            context.read<HomeViewModel>().loadNextQuotes();
          },
          icon: const Icon(Icons.download),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
