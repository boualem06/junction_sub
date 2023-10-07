import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:sh7i7a/colors.dart';
import 'package:sh7i7a/controllers/goals_controller.dart';
import 'package:sh7i7a/controllers/nav_bar_controller.dart';
import 'package:sh7i7a/screens/accounts/accounts_screen.dart';
import 'package:sh7i7a/screens/accounts/qr_code_trans.dart';
import 'package:sh7i7a/screens/accounts/widget/account_card.dart';
import 'package:sh7i7a/screens/home/widgets/day_quote.dart';
import 'package:sh7i7a/screens/home/widgets/transaction.dart';
import 'package:sh7i7a/screens/recommend/can_i_buy_screen.dart';
import 'package:sh7i7a/utils.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<NavBarController>(
        builder: (context, navBarController, child) {
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
                      const Column(
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
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => CanIBuyScreen()));
                        },
                        child: Container(
                            padding: const EdgeInsets.all(12),
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: darkBlue,
                            ),
                            child: const Icon(
                              Icons.question_mark,
                              color: white,
                            )),
                      ),
                      const SizedBox(width: 8),
                      Container(
                        padding: const EdgeInsets.all(12),
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: darkBlue,
                        ),
                        child: SvgPicture.asset(
                          getIcon('loop'),
                          width: 20,
                          color: white,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  //! Accounts Amounts
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const AccountsScreen()));
                    },
                    child: Container(
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
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: grey,
                            ),
                            child: Image.asset(
                              getImage('profile'),
                            ),
                          ),
                          const SizedBox(height: 20),
                          const Text(
                            'Your available balance is',
                            style: TextStyle(
                              fontSize: 15,
                              color: white,
                              fontWeight: FontWeight.w200,
                            ),
                          ),
                          const Text(
                            '998000 DZD',
                            style: TextStyle(
                              fontSize: 34,
                              color: white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 20),
                          const Text(
                            'Your estimated Zakat: DZD45,000',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 20,
                              color: red,
                            ),
                          ),
                          const SizedBox(height: 20),
                          const AccountCard(
                              bankName: 'ALGERIE POSTE', bankAmount: 12000),
                          const AccountCard(
                              bankName: 'GULF Bank', bankAmount: 7899),
                          const AccountCard(bankName: 'BDL', bankAmount: 34000),
                          const AccountCard(
                              bankName: 'Cash', bankAmount: 41300),
                          const SizedBox(
                            height: 10,
                          ),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(height: 20),

                  //! Day Quote
                  const DayQuote(),

                  const SizedBox(height: 20),

                  //! Goals
                  const Text(
                    'My Goals',
                    style: TextStyle(
                      fontSize: 20,
                      color: white,
                    ),
                  ),

                  const SizedBox(height: 10),

                  InkWell(
                    onTap: () {
                      navBarController.navigateTo(navBarController.navs[1], 1);
                    },
                    child: Container(
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
                            Provider.of<GoalsController>(context)
                                .goals[0]
                                .goalName,
                            style: const TextStyle(
                              fontSize: 17,
                              color: white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 10),
                          const Text(
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
                              color: Provider.of<GoalsController>(context)
                                          .goals[0]
                                          .goalType ==
                                      'Spending'
                                  ? red.withOpacity(.5)
                                  : green.withOpacity(.5),
                              borderRadius: BorderRadius.circular(2.5),
                            ),
                            child: Container(
                              decoration: BoxDecoration(
                                color: Provider.of<GoalsController>(context)
                                            .goals[0]
                                            .goalType ==
                                        'Spending'
                                    ? red
                                    : green,
                                borderRadius: BorderRadius.circular(2.5),
                              ),
                              width: 320 *
                                  Provider.of<GoalsController>(context)
                                      .goals[0]
                                      .progress,
                              height: 5,
                            ),
                          ),
                          const SizedBox(height: 10),
                          const Text(
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
                  ),

                  const SizedBox(height: 10),
                  InkWell(
                    onTap: () {
                      navBarController.navigateTo(navBarController.navs[1], 1);
                    },
                    child: Container(
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
                            Provider.of<GoalsController>(context)
                                .goals[1]
                                .goalName,
                            style: const TextStyle(
                              fontSize: 17,
                              color: white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 10),
                          const Text(
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
                              color: Provider.of<GoalsController>(context)
                                          .goals[1]
                                          .goalType ==
                                      'Spending'
                                  ? red.withOpacity(.5)
                                  : green.withOpacity(.5),
                              borderRadius: BorderRadius.circular(2.5),
                            ),
                            child: Container(
                              decoration: BoxDecoration(
                                color: Provider.of<GoalsController>(context)
                                            .goals[1]
                                            .goalType ==
                                        'Spending'
                                    ? red
                                    : green,
                                borderRadius: BorderRadius.circular(2.5),
                              ),
                              width: 320 *
                                  Provider.of<GoalsController>(context)
                                      .goals[1]
                                      .progress,
                              height: 5,
                            ),
                          ),
                          const SizedBox(height: 10),
                          const Text(
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
                  ),

                  const SizedBox(height: 20),

                  const Text(
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
                    child: const Column(
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
                        SizedBox(height: 15),
                        TransactionWidget(
                            reciever: 'John Ogaga',
                            bank: 'Zenith Bank',
                            ammount: 20973),
                        TransactionWidget(
                            reciever: 'Habib Yugurt',
                            bank: 'GT-Bank',
                            ammount: -3223),
                        TransactionWidget(
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
    });
  }
}
