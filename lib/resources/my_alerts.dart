import 'package:flutter/material.dart';

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
          label: 'CLOSE',
          onPressed: () {
            ScaffoldMessenger.of(context).hideCurrentSnackBar();
          },
        ),
      ),
    );
  }
}
