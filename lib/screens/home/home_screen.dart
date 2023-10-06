import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sh7i7a/colors.dart';
import 'package:sh7i7a/screens/home/widgets/day_quote.dart';
import 'package:sh7i7a/screens/home/widgets/transaction.dart';
import 'package:sh7i7a/utils.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: blue,
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //! App Bar
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Hello John',
                          style: TextStyle(
                            fontSize: 19,
                            color: white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'Your finances are looking good',
                          style: TextStyle(
                            fontSize: 15,
                            color: white,
                            fontWeight: FontWeight.w200,
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: darkBlue,
                      ),
                      child: SvgPicture.asset(
                        getIcon('bell'),
                        width: 20,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: darkBlue,
                      ),
                      child: SvgPicture.asset(
                        getIcon('loop'),
                        width: 20,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                //! Accounts Amounts
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: darkBlue,
                  ),
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: grey,
                        ),
                        child: Image.asset(
                          getImage('profile'),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Text(
                        'Your available balance is',
                        style: TextStyle(
                          fontSize: 15,
                          color: white,
                          fontWeight: FontWeight.w200,
                        ),
                      ),
                      Text(
                        '998000 DZD',
                        style: TextStyle(
                          fontSize: 34,
                          color: white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 20),
                      Text(
                        'By this time, last month you spent slightly higher (2500 DZD)',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 16,
                          color: white,
                        ),
                      ),
                      const SizedBox(height: 20),
                      bankAmount(bankName: 'Kuda Bank', bankAmount: 12000),
                      bankAmount(bankName: 'GT Bank', bankAmount: 7899),
                      bankAmount(bankName: 'PiggyVest', bankAmount: 34000),
                    ],
                  ),
                ),

                const SizedBox(height: 20),

                //! Day Quote
                const DayQuote(),

                const SizedBox(height: 20),

                //! Goals
                Text(
                  'My Goals',
                  style: TextStyle(
                    fontSize: 20,
                    color: white,
                  ),
                ),

                const SizedBox(height: 10),

                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: darkBlue,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'New Car',
                        style: TextStyle(
                          fontSize: 17,
                          color: white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        'Left out of N80,888 budgeted',
                        style: TextStyle(
                          fontSize: 17,
                          color: white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Container(
                        height: 5,
                        width: double.infinity,
                        alignment: Alignment.centerLeft,
                        decoration: BoxDecoration(
                          color: green.withOpacity(.5),
                          borderRadius: BorderRadius.circular(2.5),
                        ),
                        child: Container(
                          decoration: BoxDecoration(
                            color: green,
                            borderRadius: BorderRadius.circular(2.5),
                          ),
                          width: 120,
                          height: 5,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        'Saga go soon catch you bros, calm down!!',
                        style: TextStyle(
                          fontSize: 17,
                          color: white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 20),

                Text(
                  'Transactions',
                  style: TextStyle(
                    fontSize: 19,
                    color: white,
                  ),
                ),

                const SizedBox(height: 10),

                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: darkBlue,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Recent Transactions',
                        style: TextStyle(
                          fontSize: 17,
                          color: white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 15),
                      const TransactionWidget(
                          reciever: 'John Ogaga',
                          bank: 'Zenith Bank',
                          ammount: 20973),
                      const TransactionWidget(
                          reciever: 'Habib Yugurt',
                          bank: 'GT-Bank',
                          ammount: -3223),
                      const TransactionWidget(
                          reciever: 'Kamel Orugu',
                          bank: 'GT-Bank',
                          ammount: 12344),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget bankAmount({required String bankName, required int bankAmount}) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Row(
        children: [
          Text(
            bankName,
            style: TextStyle(
              fontSize: 20,
              color: white,
            ),
          ),
          const Spacer(),
          Text(
            '$bankAmount DZD',
            style: TextStyle(
              fontSize: 20,
              color: white,
            ),
          ),
        ],
      ),
    );
  }
}
