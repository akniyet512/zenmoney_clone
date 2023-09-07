import 'package:flutter/material.dart';
import 'package:zenmoney_clone/resources/local_keys.dart';
import 'package:zenmoney_clone/resources/my_alerts.dart';
import 'package:zenmoney_clone/services/cloud_firestore_services.dart';
import 'package:zenmoney_clone/services/firebase_authorization_services.dart';
import 'package:zenmoney_clone/ui/navigations/main_navigation.dart';
import 'package:zenmoney_clone/utilities/multilanguages.dart';

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
                await CloudFirestoreServices.createAccount(
                  uid: userCredential.user!.uid,
                  name: MultiLanguages.of(context)!.translate(LocalKeys.cash),
                  amount: 0,
                ).whenComplete(() async {
                  await Navigator.of(context)
                      .pushReplacementNamed(MainNavigationRouteNames.main);
                });
              });
            }
          });
        } else {
          MyAlerts.showSnakBar(
            context,
            title: MultiLanguages.of(context)!.translate(LocalKeys.noGoogleAccount),
          );
        }
      });
    } catch (e) {
      if (!context.mounted) return;
      MyAlerts.showSnakBar(
        context,
        title: "${MultiLanguages.of(context)!.translate(LocalKeys.somethingWrong)}: $e",
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
