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
        //TODO: SNACKBAR AND PUSH REPLACEMENT
      });
    } catch (e) {
      await MyAlerts.showTextDialog(
        context,
        title: "Alert",
        content: "Something went wrong: $e",
        buttonText: "OK",
      );
    }
  }
}
