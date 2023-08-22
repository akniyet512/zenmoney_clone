import 'package:flutter/material.dart';
import 'package:zenmoney_clone/ui/navigations/main_navigation.dart';

class SignInNotifier extends ChangeNotifier {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool _isObscure = true;
  bool get isObscure => _isObscure;

  void setObscure(bool value) {
    _isObscure = value;
    notifyListeners();
  }

  void navigateBack(BuildContext context) {
    Navigator.of(context).pop();
  }

  Future<void> signInWithEmailAndPassword(BuildContext context) async {}

  Future<void> navigateToForgotPassword(BuildContext context) async {
    await Navigator.of(context).pushNamed(MainNavigationRouteNames.forgotPassword);
  }
}
