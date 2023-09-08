import 'package:flutter/material.dart';
import 'package:zenmoney_clone/ui/screens/accounts/accounts_screen.dart';
import 'package:zenmoney_clone/ui/screens/analytics/analytics_screen.dart';
import 'package:zenmoney_clone/ui/screens/more/more_screen.dart';
import 'package:zenmoney_clone/ui/screens/transactions_screen/transactions_screen.dart';

class MainNotifier extends ChangeNotifier {
  int currentIndex = 0;

  final List<Widget> pages = [
    const AccountsScreen(),
    const TransactionsScreen(),
    const AnalyticsScreen(),
    const MoreScreen(),
  ];

  void onBottomNavigationBarItemTap(int index) {
    currentIndex = index;
    notifyListeners();
  }
}
