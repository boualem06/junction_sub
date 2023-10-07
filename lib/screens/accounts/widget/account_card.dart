import 'package:flutter/material.dart';
import 'package:sh7i7a/colors.dart';
import 'package:sh7i7a/utils.dart';

class AccountCard extends StatelessWidget {
  final String bankName;
  final String? bankIcon;
  final int bankAmount;
  final Color color;
  const AccountCard(
      {super.key,
      required this.bankName,
      required this.bankAmount,
      this.color = Colors.white,
      this.bankIcon});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Row(
        children: [
          if (bankIcon != null)
            SizedBox(
                width: 60, child: Image.asset('assets/images/${bankIcon!}')),
          Text(
            bankName,
            style: TextStyle(
              fontSize: 20,
              color: color,
            ),
          ),
          const Spacer(),
          Text(
            'DZD $bankAmount',
            style: TextStyle(
              fontSize: 20,
              color: color,
            ),
          ),
        ],
      ),
    );
  }
}
