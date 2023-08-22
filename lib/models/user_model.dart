import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String id;
  final String email;
  final int userMode;
  final DateTime created;

  UserModel({
    required this.id,
    required this.email,
    required this.userMode,
    required this.created,
  });

  static UserModel fromDoc(DocumentSnapshot documentSnapshot) {
    return UserModel(
      id: documentSnapshot.id,
      email: documentSnapshot.get("email"),
      userMode: documentSnapshot.get("userMode"),
      created: documentSnapshot.get("created").toDate(),
    );
  }
}
