import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:zenmoney_clone/models/account_model.dart';
import 'package:zenmoney_clone/services/firebase_authorization_services.dart';

class CloudFirestoreServices {
  static Future<void> setUserData({
    required String uid,
    required String email,
    required int appMode,
  }) async {
    await FirebaseFirestore.instance.collection("users").doc(uid).set(
      {
        "email": email,
        "appMode": appMode,
        "created": DateTime.now(),
      },
    );
  }

  static Future<void> createAccount({
    required String uid,
    required String name,
    required double amount,
    required String currency,
    required bool isBeforeCurrency,
    String? accountId,
  }) async {
    await FirebaseFirestore.instance
        .collection("users")
        .doc(uid)
        .collection("accounts")
        .doc(accountId)
        .set(
      {
        "name": name,
        "amount": amount,
        "created": DateTime.now(),
        "currency": currency,
        "isBeforeCurrency": isBeforeCurrency,
      },
      SetOptions(merge: true),
    );
  }

  static Future<Map<String, dynamic>> getAppParameters() async {
    DocumentSnapshot documentSnapshot = await FirebaseFirestore.instance
        .collection("app")
        .doc("parameters")
        .get();
    return documentSnapshot.data() as Map<String, dynamic>;
  }

  static Future<bool> checkUserExists({
    required String uid,
  }) async {
    DocumentSnapshot documentSnapshot =
        await FirebaseFirestore.instance.collection('users').doc(uid).get();

    return documentSnapshot.exists;
  }

  static Stream<List<AccountModel>> get getAccountModels {
    return FirebaseFirestore.instance
        .collection("users")
        .doc(FirebaseAuthorizationServices.currentUser!.uid)
        .collection("accounts")
        .snapshots()
        .map((querySnapshot) => querySnapshot.docs
            .map((documentSnapshot) => AccountModel.fromDoc(documentSnapshot))
            .toList());
  }
}
