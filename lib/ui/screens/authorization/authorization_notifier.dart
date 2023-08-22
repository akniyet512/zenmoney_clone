import 'package:flutter/material.dart';
import 'package:zenmoney_clone/resources/my_alerts.dart';
import 'package:zenmoney_clone/services/cloud_firestore_services.dart';
import 'package:zenmoney_clone/services/firebase_authorization_services.dart';
import 'package:zenmoney_clone/ui/navigations/main_navigation.dart';

class AuthoriationNotifier {
  Future<void> signInWithGoogle(BuildContext context) async {
    try {
      await FirebaseAuthorizationServices.signInWithGoogle()
          .then((userCredential) async {
        if (userCredential != null) {
          await CloudFirestoreServices.checkUserExists(
                  uid: userCredential.user!.uid)
              .then((isUserExists) async {
            if (isUserExists) {
              await Navigator.of(context)
                  .pushReplacementNamed(MainNavigationRouteNames.main);
            } else {
              await CloudFirestoreServices.setUserData(
                uid: userCredential.user!.uid,
                email: userCredential.user!.email!,
                appMode: 0,
              ).whenComplete(() async {
                await Navigator.of(context)
                    .pushReplacementNamed(MainNavigationRouteNames.main);
              });
            }
          });
        } else {
          MyAlerts.showSnakBar(
            context,
            title: "Can't find such google account!",
          );
        }
      });
    } catch (e) {
      MyAlerts.showSnakBar(
        context,
        title: "Something went wrong: $e",
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
