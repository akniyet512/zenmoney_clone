import 'package:flutter/material.dart';
import 'package:zenmoney_clone/resources/local_keys.dart';
import 'package:zenmoney_clone/utilities/multilanguages.dart';

class MyAlerts {
  MyAlerts._();

  static void showSnakBar(
    BuildContext context, {
    required String title,
  }) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(title),
        duration: const Duration(
            seconds: 3), 
        action: SnackBarAction(
          label: MultiLanguages.of(context)!.translate(LocalKeys.close),
          onPressed: () {
            ScaffoldMessenger.of(context).hideCurrentSnackBar();
          },
        ),
      ),
    );
  }
}
