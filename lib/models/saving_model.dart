import 'package:cloud_firestore/cloud_firestore.dart';

class SavingModel {
  final String id;
  final DateTime created;
  final double amount;
  final String name;

  SavingModel({
    required this.id,
    required this.created,
    required this.amount,
    required this.name,
  });

  static SavingModel fromDoc(DocumentSnapshot documentSnapshot) {
    return SavingModel(
      id: documentSnapshot.id,
      created: documentSnapshot.get("created").toDate(),
      name: documentSnapshot.get("name"),
      amount: documentSnapshot.get("amount"),
    );
  }
}
