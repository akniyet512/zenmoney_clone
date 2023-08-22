import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:zenmoney_clone/services/firebase_authorization_services.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:zenmoney_clone/ui/navigations/main_navigation.dart';

class MoreScreen extends StatelessWidget {
  const MoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ElevatedButton(
        onPressed: () async {
          if (FirebaseAuthorizationServices.isGoogleSignIn!) {
            await GoogleSignIn().disconnect();
          }
          await FirebaseAuth.instance.signOut().whenComplete(() =>
              Navigator.of(context).pushReplacementNamed(
                  MainNavigationRouteNames.authorization));
        },
        child: const Text("Exit"),
      ),
    );
  }
}
