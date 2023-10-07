import 'package:dinar/controllers/bank_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:dinar/colors.dart';
import 'package:dinar/controllers/goals_controller.dart';
import 'package:dinar/controllers/nav_bar_controller.dart';
import 'package:dinar/screens/accounts/accounts_screen.dart';
import 'package:dinar/screens/accounts/qr_code_trans.dart';
import 'package:dinar/screens/accounts/widget/account_card.dart';
import 'package:dinar/screens/home/widgets/day_quote.dart';
import 'package:dinar/screens/home/widgets/transaction.dart';
import 'package:dinar/screens/recommend/can_i_buy_screen.dart';
import 'package:dinar/utils.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<BankController>(builder: (context, bankController, child) {
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
                              'Hello AbdErrazak',
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
                            Text(
                              'DZD${bankController.sum}',
                              style: const TextStyle(
                                fontSize: 34,
                                color: white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 20),
                            Text(
                              'Your estimated Zakat: DZD${bankController.zakat}',
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                fontSize: 20,
                                color: red,
                              ),
                            ),
                            const SizedBox(height: 20),
                            AccountCard(
                                bankName: bankController.banks[0].name,
                                bankAmount: bankController.banks[0].value),
                            AccountCard(
                                bankName: bankController.banks[1].name,
                                bankAmount: bankController.banks[1].value),
                            AccountCard(
                                bankName: bankController.banks[2].name,
                                bankAmount: bankController.banks[2].value),
                            AccountCard(
                                bankName: bankController.banks[3].name,
                                bankAmount: bankController.banks[3].value),
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
                        navBarController.navigateTo(
                            navBarController.navs[1], 1);
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
                        navBarController.navigateTo(
                            navBarController.navs[1], 1);
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
    });
  }
}
