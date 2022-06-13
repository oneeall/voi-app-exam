import 'package:flutter/material.dart';
import 'package:mobile_app/main.dart';

/// Example for Class Mixin
mixin DialogMixin {
  void showDialogCustom({
    required String title,
    required String subtitle,
    bool barrierDismissible = true,
  }) {
    showDialog(
      context: MyApp.myAppScaffoldKey.currentContext!,
      barrierDismissible: barrierDismissible,
      builder: (_) => Dialog(
        insetPadding: const EdgeInsets.all(18),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.0),
        ),
        elevation: 0.0,
        child: ListTile(
          title: Text(title),
          subtitle: Text(subtitle),
        ),
      ),
    );
  }
}
