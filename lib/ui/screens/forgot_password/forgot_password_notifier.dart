import 'package:flutter/material.dart';
import 'package:zenmoney_clone/resources/my_alerts.dart';
import 'package:zenmoney_clone/services/firebase_authorization_services.dart';

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
            title: "Link has been sent to your email!");
        Navigator.of(context).pop();
      });
    } catch (e) {
      MyAlerts.showSnakBar(
        context,
        title: "Something went wrong: $e",
      );
    }
  }
}
