import 'package:cloud_firestore/cloud_firestore.dart';

class AccountModel {
  final String id;
  final DateTime created;
  final double amount;
  final String name;

  AccountModel({
    required this.id,
    required this.created,
    required this.amount,
    required this.name,
  });

  static AccountModel fromDoc(DocumentSnapshot documentSnapshot) {
    return AccountModel(
      id: documentSnapshot.id,
      created: documentSnapshot.get("created").toDate(),
      name: documentSnapshot.get("name"),
      amount: documentSnapshot.get("amount"),
    );
  }
}
