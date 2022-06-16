import 'package:flutter/material.dart';
import 'package:mobile_app/src/ui/mixins/dialog_mixin.dart';

class HomeFloatingActionButton extends StatelessWidget with DialogMixin {
  const HomeFloatingActionButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      tooltip: 'show dialog',
      child: const Icon(
        Icons.notification_important,
      ),
      onPressed: () {
        showDialogCustom(
          title: 'title',
          subtitle: 'subtitle',
        );
      },
    );
  }
}
