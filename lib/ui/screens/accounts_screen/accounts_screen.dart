import 'package:flutter/material.dart';
import 'package:zenmoney_clone/resources/my_colors.dart';
import 'package:zenmoney_clone/ui/widgets/cash_amount.dart';

class AccountsScreen extends StatelessWidget {
  const AccountsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.background,
      appBar: AppBar(
        backgroundColor: MyColors.background,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CashAmount(
                  amount: 8036.15,
                  currency: 'T',
                  isBeforeCurrency: true,
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: MyColors.foreground,
                ),
                Text(
                  "Balance",
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
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            //section 1
            Column(
              children: [
                //section 1 title
                Container(
                  padding: const EdgeInsets.all(16),
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Cards and accounts",
                    style: TextStyle(
                      color: MyColors.foreground,
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
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
            ),
            //section 2
            Column(
              children: [
                //section 2 title
                Container(
                  padding: const EdgeInsets.all(16),
                  alignment: Alignment.centerLeft,
                  child: GestureDetector(
                    onTap: () {},
                    child: Row(
                      children: [
                        Text(
                          "Savings",
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
            ),
            //section 3
            Column(
              children: [
                //section 3 title
                Container(
                  padding: const EdgeInsets.all(16),
                  alignment: Alignment.centerLeft,
                  child: GestureDetector(
                    onTap: () {},
                    child: Row(
                      children: [
                        Text(
                          "Debts",
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
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "I owe",
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
            ),
          ],
        ),
      ),
    );
  }
}
