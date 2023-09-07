import 'package:flutter/material.dart';
import 'package:zenmoney_clone/resources/my_colors.dart';
import 'package:zenmoney_clone/ui/widgets/cash_amount.dart';
//TODO
class TransactionModel {
  final DateTime created;
  final String description;

  TransactionModel({required this.created, required this.description});
}

List<TransactionModel> transactionList = [
  TransactionModel(created: DateTime(2023, 8, 1), description: "Transaction 1"),
  TransactionModel(created: DateTime(2023, 8, 1), description: "Transaction 2"),
  TransactionModel(created: DateTime(2023, 8, 1), description: "Transaction 3"),
  TransactionModel(created: DateTime(2023, 8, 1), description: "Transaction 4"),
  TransactionModel(created: DateTime(2023, 8, 1), description: "Transaction 5"),
  TransactionModel(created: DateTime(2023, 8, 2), description: "Transaction 6"),
  TransactionModel(created: DateTime(2023, 8, 2), description: "Transaction 7"),
  TransactionModel(created: DateTime(2023, 8, 2), description: "Transaction 8"),
  TransactionModel(created: DateTime(2023, 8, 3), description: "Transaction 9"),
  TransactionModel(
      created: DateTime(2023, 8, 3), description: "Transaction 10"),
  TransactionModel(
      created: DateTime(2023, 8, 3), description: "Transaction 11"),
  TransactionModel(
      created: DateTime(2023, 8, 3), description: "Transaction 12"),
  // Add more transactions here
].reversed.toList();

class TransactionsScreen extends StatelessWidget {
  const TransactionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.background,
      appBar: AppBar(
        backgroundColor: MyColors.secondaryBackground,
        titleSpacing: 0,
        toolbarHeight: 120,
        title: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
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
                  Icon(
                    Icons.search,
                    color: MyColors.foreground,
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Align(
                alignment: Alignment.centerLeft,
                child: GestureDetector(
                  onTap: () {},
                  child: IntrinsicWidth(
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(),
                        borderRadius: const BorderRadius.all(
                          Radius.circular(24),
                        ),
                        color: MyColors.background,
                      ),
                      padding: const EdgeInsets.all(8),
                      child: Row(
                        children: [
                          Icon(
                            Icons.sort,
                            color: MyColors.foreground,
                            size: 24,
                          ),
                          const SizedBox(width: 8),
                          Text(
                            "Filter",
                            style: TextStyle(
                              color: MyColors.foreground,
                              fontSize: 18,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: transactionList.length,
        itemBuilder: (context, index) {
          final TransactionModel currentTransaction = transactionList[index];
          final TransactionModel? previousTransaction =
              index > 0 ? transactionList[index - 1] : null;

          if (previousTransaction == null ||
              currentTransaction.created != previousTransaction.created) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: Text(
                    currentTransaction.created.toString(),
                    style: TextStyle(
                      color: MyColors.foreground,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Row(
                  children: [
                    Column(
                      children: [
                        Text(currentTransaction.description),
                        Text(currentTransaction.created.toString())
                      ],
                    ),
                    CashAmount(
                      currency: "T",
                      amount: 2314.56,
                      isBeforeCurrency: true,
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: MyColors.foreground,
                    )
                  ],
                ),
              ],
            );
          }
          return Row(
            children: [
              
              Column(
                children: [
                  Text(currentTransaction.description),
                  Text(currentTransaction.created.toString())
                ],
              ),
              CashAmount(
                currency: "T",
                amount: 2314.56,
                isBeforeCurrency: true,
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: MyColors.foreground,
              )
            ],
          );
        },
      ),
    );
  }
}
