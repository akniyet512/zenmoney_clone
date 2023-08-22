import 'package:flutter/material.dart';
import 'package:zenmoney_clone/resources/my_alerts.dart';
import 'package:zenmoney_clone/services/firebase_authorization_services.dart';
import 'package:zenmoney_clone/ui/navigations/main_navigation.dart';

class AuthoriationNotifier {
  Future<void> signInWithGoogle(BuildContext context) async {
    try {
      await FirebaseAuthorizationServices.signInWithGoogle()
          .then((userCredential) async {
        if (userCredential != null) {
          Navigator.of(context)
              .pushReplacementNamed(MainNavigationRouteNames.main);
        } else {
          await MyAlerts.showTextDialog(
            context,
            title: "Alert",
            content: "Can't find such google account!",
            buttonText: "OK",
          );
        }
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

  Future<void> navigateToSignIn(BuildContext context) async {
    await Navigator.of(context).pushNamed(MainNavigationRouteNames.signIn);
  }

  Future<void> navigateToSignUp(BuildContext context) async {
    await Navigator.of(context).pushNamed(MainNavigationRouteNames.signUp);
  }
}
