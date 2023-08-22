import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:zenmoney_clone/resources/my_alerts.dart';
import 'package:zenmoney_clone/services/cloud_firestore_services.dart';
import 'package:zenmoney_clone/services/firebase_authorization_services.dart';
import 'package:zenmoney_clone/ui/navigations/main_navigation.dart';

class SignUpNotifier extends ChangeNotifier {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool _isAgreementSelected = false;
  bool _isObscure = true;

  bool get isAgreementSelected => _isAgreementSelected;

  bool get isObscure => _isObscure;
  bool _isAuthProgress = false;

  bool get canStartAuth => !_isAuthProgress;
  bool get isAuthProgress => _isAuthProgress;

  void setAgreementSelected(bool value) {
    _isAgreementSelected = value;
    notifyListeners();
  }

  void setObscure(bool value) {
    _isObscure = value;
    notifyListeners();
  }

  void navigateBack(BuildContext context) {
    Navigator.of(context).pop();
  }

  Future<void> _launchURL(String url) async {
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
    }
  }

  Future<void> launchPrivacyPolicyUrl(BuildContext context) async {
    Map<String, dynamic> appParameters =
        await CloudFirestoreServices.getAppParameters();
    String privacyPolicyUrl = appParameters["privacyPolicy"];
    await _launchURL(privacyPolicyUrl);
  }

  Future<void> launchUserAgreementUrl(BuildContext context) async {
    Map<String, dynamic> appParameters =
        await CloudFirestoreServices.getAppParameters();
    String userAgreementUrl = appParameters["userAgreement"];
    await _launchURL(userAgreementUrl);
  }

  bool _isEmailFormatted(String email) {
    List<String> parts = email.split('@');
    if (parts.length != 2) {
      return false;
    }
    if (!parts[1].contains('.')) {
      return false;
    }
    return true;
  }

  bool _isStrongPassword(String password) {
    if (password.length < 8) {
      return false;
    }
    if (!password.contains(RegExp(r'[A-Z]'))) {
      return false;
    }
    if (!password.contains(RegExp(r'[a-z]'))) {
      return false;
    }
    if (!password.contains(RegExp(r'[0-9]'))) {
      return false;
    }
    return true;
  }

  Future<void> signUpWithEmailAndPassword(BuildContext context) async {
    if (_isAgreementSelected) {
      if (_isEmailFormatted(emailController.text)) {
        if (_isStrongPassword(passwordController.text)) {
          _isAuthProgress = true;
          notifyListeners();
          try {
            await FirebaseAuthorizationServices.signUpUserWithEmailAndPassword(
              email: emailController.text,
              password: passwordController.text,
            ).then((uid) async {
              await CloudFirestoreServices.setUserData(
                uid: uid,
                email: emailController.text,
                appMode: 0,
              ).whenComplete(() async {
                _isAuthProgress = false;
                notifyListeners();
                await Navigator.of(context)
                    .pushReplacementNamed(MainNavigationRouteNames.main);
              });
            });
          } catch (e) {
            _isAuthProgress = false;
            notifyListeners();
            MyAlerts.showSnakBar(
              context,
              title: e.toString(),
            );
          }
        } else {
          MyAlerts.showSnakBar(
            context,
            title:
                "Password should contain at least 8 charachters, at least 1 lower case charachter,  at least 1 upper case charachter,  at least 1 numerical charachter.",
          );
        }
      } else {
        MyAlerts.showSnakBar(
          context,
          title: "Please enter correct email!",
        );
      }
    } else {
      MyAlerts.showSnakBar(
        context,
        title: "You have to select agreement!",
      );
    }
  }
}
