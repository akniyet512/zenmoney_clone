import 'package:flutter/material.dart';

class SignUpNotifier extends ChangeNotifier {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool _isAgreementSelected = false;
  bool _isObscure = true;

  bool get isAgreementSelected => _isAgreementSelected;

  bool get isObscure => _isObscure;

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

  Future<void> signUpWithEmailAndPassword(BuildContext context) async {

  }
}
