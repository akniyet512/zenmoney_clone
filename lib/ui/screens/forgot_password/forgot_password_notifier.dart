import 'package:flutter/material.dart';
import 'package:zenmoney_clone/resources/local_keys.dart';
import 'package:zenmoney_clone/resources/my_alerts.dart';
import 'package:zenmoney_clone/services/firebase_authorization_services.dart';
import 'package:zenmoney_clone/utilities/multilanguages.dart';

class ForgotPasswordNotifier extends ChangeNotifier {
  final TextEditingController emailController = TextEditingController();

  void navigateBack(BuildContext context) {
    Navigator.of(context).pop();
  }

  Future<void> resetPassword(BuildContext context) async {
    try {
      await FirebaseAuthorizationServices.resetPassword(
              email: emailController.text)
          .whenComplete(() {
        MyAlerts.showSnakBar(context,
            title: MultiLanguages.of(context)!.translate(LocalKeys.linkSent));
        Navigator.of(context).pop();
      });
    } catch (e) {
      if (!context.mounted) return;
      MyAlerts.showSnakBar(
        context,
        title:
            "${MultiLanguages.of(context)!.translate(LocalKeys.somethingWrong)}: $e",
      );
    }
  }
}
