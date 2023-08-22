import 'package:zenmoney_clone/services/firebase_authorization_services.dart';

class MyAppModel {
  bool _isAuth = false;

  bool get isAuth => _isAuth;

  void checkOut()  {
    _isAuth = FirebaseAuthorizationServices().currentUser != null;
  }
}
