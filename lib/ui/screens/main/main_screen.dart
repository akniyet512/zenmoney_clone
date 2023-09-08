import 'package:flutter/material.dart';
import 'package:zenmoney_clone/resources/local_keys.dart';
import 'package:zenmoney_clone/resources/my_colors.dart';
import 'package:zenmoney_clone/ui/screens/main/main_notifier.dart';
import 'package:zenmoney_clone/utilities/multilanguages.dart';
import 'package:zenmoney_clone/utilities/provider.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return NotifierProvider(
      model: MainNotifier(),
      child: const _ScreenContent(),
    );
  }
}

class _ScreenContent extends StatelessWidget {
  const _ScreenContent();

  @override
  Widget build(BuildContext context) {
    final MainNotifier model =
        NotifierProvider.watch<MainNotifier>(context)!;
    return Scaffold(
      body: model.pages[model.currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: MyColors.primary,
        currentIndex: model.currentIndex,
        unselectedItemColor: MyColors.secondaryForeground,
        showUnselectedLabels: true,
        onTap: model.onBottomNavigationBarItemTap,
        items: [
          BottomNavigationBarItem(
            icon: const Icon(Icons.credit_card),
            label: MultiLanguages.of(context)!.translate(LocalKeys.accounts),
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.swap_horiz),
            label:
                MultiLanguages.of(context)!.translate(LocalKeys.transactions),
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.analytics),
            label: MultiLanguages.of(context)!.translate(LocalKeys.analytics),
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.menu),
            label: MultiLanguages.of(context)!.translate(LocalKeys.more),
          ),
        ],
      ),
    );
  }
}
