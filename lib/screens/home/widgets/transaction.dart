import 'package:flutter/material.dart';
import 'package:dinar/colors.dart';

class TransactionWidget extends StatelessWidget {
  final String reciever, bank;
  final int ammount;
  const TransactionWidget(
      {super.key,
      required this.reciever,
      required this.bank,
      required this.ammount});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          const CircleAvatar(
            radius: 16,
          ),
          const SizedBox(width: 8),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'John Ogaga',
                style: TextStyle(
                  fontSize: 14,
                  color: white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'Zenith Bank 12:03 AM',
                style: TextStyle(
                  fontSize: 14,
                  color: white,
                  fontWeight: FontWeight.w200,
                ),
              ),
            ],
          ),
          const Spacer(),
          Text(
            '${ammount.isNegative ? '-' : '+'}DZD$ammount',
            style: TextStyle(
              fontSize: 17,
              color: ammount.isNegative ? red : green,
              fontWeight: FontWeight.bold,
            ),
          )
        ],
      ),
    );
  }
}
