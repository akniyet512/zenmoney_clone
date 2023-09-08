import 'dart:async';

import 'package:flutter/material.dart';
import 'package:zenmoney_clone/models/account_model.dart';
import 'package:zenmoney_clone/services/cloud_firestore_services.dart';

class AccountsNotifier extends ChangeNotifier {
  Stream<double> getBalanceStream() {
    final StreamController<double> streamController =
        StreamController<double>();

    double totalAmount = 0;

    CloudFirestoreServices.getAccountModels
        .listen((List<AccountModel> accountList) {
      totalAmount = 0;

      for (final account in accountList) {
        totalAmount += account.amount;
      }

      streamController.sink.add(totalAmount);
    });

    return streamController.stream;
  }
}
