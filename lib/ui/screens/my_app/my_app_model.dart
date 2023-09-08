import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:zenmoney_clone/resources/constants.dart';
import 'package:zenmoney_clone/services/firebase_authorization_services.dart';

class MyAppModel extends ChangeNotifier{
  bool _isAuth = false;

  bool get isAuth => _isAuth;

  void checkOut()  {
    _isAuth = FirebaseAuthorizationServices.currentUser != null;
  }

  Locale? locale;
  bool isLoading = true;
  SharedPreferences? mySharedPreferences;

  void changeLocale({required Locale locale}) {
    this.locale = locale;
    notifyListeners();
  }

  List<Locale> locales = const [
    Locale("en", "US"),
    Locale("ru", "RU"),
    Locale("kk", "KZ"),
  ];

  Future<void> setData() async {
    await SharedPreferences.getInstance().then((mySharedPreferences) {
      mySharedPreferences = mySharedPreferences;
      locale = Locale.fromSubtags(
          languageCode: mySharedPreferences.getString("localeKey") ?? Constants.defaultLocaleKey);
      isLoading = false;
      notifyListeners();
    });
  }
}
