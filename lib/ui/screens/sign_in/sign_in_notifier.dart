import 'package:flutter/material.dart';
import 'package:zenmoney_clone/resources/my_alerts.dart';
import 'package:zenmoney_clone/services/firebase_authorization_services.dart';
import 'package:zenmoney_clone/ui/navigations/main_navigation.dart';

class SignInNotifier extends ChangeNotifier {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool _isObscure = true;
  bool get isObscure => _isObscure;
  bool _isAuthProgress = false;

  bool get canStartAuth => !_isAuthProgress;
  bool get isAuthProgress => _isAuthProgress;

  void setObscure(bool value) {
    _isObscure = value;
    notifyListeners();
  }

  void navigateBack(BuildContext context) {
    Navigator.of(context).pop();
  }

  Future<void> signInWithEmailAndPassword(BuildContext context) async {
    _isAuthProgress = true;
    notifyListeners();
    try {
      await FirebaseAuthorizationServices.signInUserWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      ).then((uid) async {
        _isAuthProgress = false;
        notifyListeners();
        await Navigator.of(context)
            .pushReplacementNamed(MainNavigationRouteNames.main);
      });
    } catch (e) {
      _isAuthProgress = false;
      notifyListeners();
      if (!context.mounted) return;
      MyAlerts.showSnakBar(
        context,
        title: e.toString(),
      );
    }
  }

  Future<void> navigateToForgotPassword(BuildContext context) async {
    await Navigator.of(context)
        .pushNamed(MainNavigationRouteNames.forgotPassword);
  }
}
