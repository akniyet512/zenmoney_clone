import 'package:cloud_firestore/cloud_firestore.dart';

class DebtModel {
  final String id;
  final DateTime created;
  final double amount;
  final String name;
  final bool iOwe;

  DebtModel({
    required this.id,
    required this.created,
    required this.amount,
    required this.name,
    required this.iOwe,
  });

  static DebtModel fromDoc(DocumentSnapshot documentSnapshot) {
    return DebtModel(
      id: documentSnapshot.id,
      created: documentSnapshot.get("created").toDate(),
      name: documentSnapshot.get("name"),
      amount: documentSnapshot.get("amount"),
      iOwe: documentSnapshot.get("iOwe"),
    );
  }
}
