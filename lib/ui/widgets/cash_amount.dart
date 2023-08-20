import 'package:flutter/material.dart';

class CashAmount extends StatelessWidget {
  final String currency;
  final double amount;
  final bool isBeforeCurrency;
  final double fontSize;
  final FontWeight fontWeight;
  final Color color;

  const CashAmount({
    super.key,
    required this.currency,
    required this.amount,
    required this.isBeforeCurrency,
    required this.fontSize,
    required this.fontWeight,
    required this.color,
  });

  String formatDouble(double value) {
    String stringValue = value.toString();
    List<String> parts = stringValue.split('.');

    String integerPart = parts[0];
    String fractionalPart = parts.length > 1 ? '.${parts[1]}' : '';

    String formattedIntegerPart = '';
    for (int i = integerPart.length - 1, count = 0; i >= 0; i--, count++) {
      formattedIntegerPart = integerPart[i] +
          (count != 0 && count % 3 == 0 ? ',' : '') +
          formattedIntegerPart;
    }

    return formattedIntegerPart + fractionalPart;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (isBeforeCurrency)
          Text(
            currency,
            style: TextStyle(
              color: color,
              fontSize: fontSize,
              fontWeight: fontWeight,
            ),
          ),
        Text(
          formatDouble(amount),
          style: TextStyle(
            color: color,
            fontSize: fontSize,
            fontWeight: fontWeight,
          ),
        ),
        if (!isBeforeCurrency)
          Text(
            currency,
            style: TextStyle(
              color: color,
              fontSize: fontSize,
              fontWeight: fontWeight,
            ),
          ),
      ],
    );
  }
}
