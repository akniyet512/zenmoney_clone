import 'package:flutter/material.dart';
import 'package:zenmoney_clone/resources/local_keys.dart';
import 'package:zenmoney_clone/resources/my_colors.dart';
import 'package:zenmoney_clone/ui/screens/accounts/accounts_notifier.dart';
import 'package:zenmoney_clone/ui/widgets/cash_amount.dart';
import 'package:zenmoney_clone/utilities/multilanguages.dart';
import 'package:zenmoney_clone/utilities/provider.dart';

class AccountsScreen extends StatelessWidget {
  const AccountsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return NotifierProvider(
      model: AccountsNotifier(),
      child: const _ScreenContent(),
    );
  }
}

class _ScreenContent extends StatelessWidget {
  const _ScreenContent();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.background,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: MyColors.secondaryBackground,
        title: const _AppBarWidget(),
      ),
      body: const SingleChildScrollView(
        child: Column(
          children: [
            _AccountsSectionWidget(),
            _SavingsSectionWidget(),
            _DebtsSectionWidget(),
          ],
        ),
      ),
    );
  }
}

class _DebtsSectionWidget extends StatelessWidget {
  const _DebtsSectionWidget();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () {},
                child: Row(
                  children: [
                    Text(
                      MultiLanguages.of(context)!.translate(LocalKeys.debts),
                      style: TextStyle(
                        color: MyColors.foreground,
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const Icon(Icons.arrow_drop_down),
                  ],
                ),
              ),
              const Icon(Icons.add),
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 8,
          ),
          alignment: Alignment.centerLeft,
          child: Text(
            MultiLanguages.of(context)!.translate(LocalKeys.iOwe),
            style: TextStyle(
              color: MyColors.secondaryForeground,
              fontSize: 16,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: 1,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 8,
                horizontal: 16,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const Icon(
                        Icons.person,
                        size: 32,
                      ),
                      const SizedBox(width: 16),
                      Text(
                        "Sagynysh",
                        style: TextStyle(
                          color: MyColors.foreground,
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                  CashAmount(
                    amount: 27000,
                    currency: 'T',
                    isBeforeCurrency: true,
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                    color: MyColors.foreground,
                  ),
                ],
              ),
            );
          },
        ),
        Divider(
          thickness: 0.5,
          color: MyColors.secondaryForeground,
        ),
      ],
    );
  }
}

class _SavingsSectionWidget extends StatelessWidget {
  const _SavingsSectionWidget();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //section 2 title
        Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () {},
                child: Row(
                  children: [
                    Text(
                      MultiLanguages.of(context)!.translate(LocalKeys.savings),
                      style: TextStyle(
                        color: MyColors.foreground,
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const Icon(Icons.arrow_drop_down),
                  ],
                ),
              ),
              const Icon(Icons.add),
            ],
          ),
        ),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: 1,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 8,
                horizontal: 16,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const Icon(
                        Icons.account_balance,
                        size: 32,
                      ),
                      const SizedBox(width: 16),
                      Text(
                        "Emergency money",
                        style: TextStyle(
                          color: MyColors.foreground,
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                  CashAmount(
                    amount: 300915.87,
                    currency: 'T',
                    isBeforeCurrency: true,
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                    color: MyColors.foreground,
                  ),
                ],
              ),
            );
          },
        ),
        Divider(
          thickness: 0.5,
          color: MyColors.secondaryForeground,
        ),
      ],
    );
  }
}

class _AccountsSectionWidget extends StatelessWidget {
  const _AccountsSectionWidget();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                MultiLanguages.of(context)!
                    .translate(LocalKeys.cardsAndAccounts),
                style: TextStyle(
                  color: MyColors.foreground,
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const Icon(Icons.add),
            ],
          ),
        ),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: 1,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 8,
                horizontal: 16,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const Icon(
                        Icons.wallet,
                        size: 32,
                      ),
                      const SizedBox(width: 16),
                      Text(
                        "Cash",
                        style: TextStyle(
                          color: MyColors.foreground,
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                  CashAmount(
                    amount: 8036.15,
                    currency: 'T',
                    isBeforeCurrency: true,
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                    color: MyColors.foreground,
                  ),
                ],
              ),
            );
          },
        ),
        Divider(
          thickness: 0.5,
          color: MyColors.secondaryForeground,
        ),
      ],
    );
  }
}

class _AppBarWidget extends StatelessWidget {
  const _AppBarWidget();

  @override
  Widget build(BuildContext context) {
    final AccountsNotifier model =
        NotifierProvider.watch<AccountsNotifier>(context)!;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            StreamBuilder(
              stream: model.getBalanceStream(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const CircularProgressIndicator();
                } else if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else {
                  double amount = snapshot.data!;
                  return CashAmount(
                    amount: amount,
                    currency: 'T',
                    isBeforeCurrency: true,
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: MyColors.foreground,
                  );
                }
              },
            ),
            Text(
              MultiLanguages.of(context)!.translate(LocalKeys.balance),
              style: TextStyle(
                color: MyColors.secondaryForeground,
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
        Row(
          children: [
            Icon(
              Icons.pie_chart_outline,
              color: MyColors.foreground,
            ),
            const SizedBox(width: 24),
            Icon(
              Icons.add,
              color: MyColors.foreground,
            ),
          ],
        ),
      ],
    );
  }
}
