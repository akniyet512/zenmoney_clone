import 'package:cloud_firestore/cloud_firestore.dart';

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
  }) async {
    await FirebaseFirestore.instance
        .collection("users")
        .doc(uid)
        .collection("accounts")
        .doc()
        .set(
      {
        "name": name,
        "amount": amount,
        "created": DateTime.now(),
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
}
