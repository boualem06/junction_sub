import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sh7i7a/colors.dart';
import 'package:sh7i7a/screens/accounts/create_account_screen.dart';
import 'package:sh7i7a/screens/accounts/widget/account_card.dart';
import 'package:sh7i7a/utils.dart';

class AccountsScreen extends StatelessWidget {
  const AccountsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(15),
                child: Row(
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: Transform.rotate(
                          angle: pi,
                          child: SvgPicture.asset(
                            getIcon('arrow'),
                            width: 18,
                          ),
                        ),
                      ),
                    ),
                    const Spacer(),
                    const Text(
                      'Accounts',
                      style: TextStyle(
                        fontSize: 24,
                        // color: white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Spacer(),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'Your available balance is',
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.grey,
                ),
              ),
              const Text(
                'DZD20,983',
                style: TextStyle(
                  fontSize: 34,
                  // color: white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Spacer(),
              //! Banks
              const AccountCard(
                bankName: 'ALGERIE POSTE',
                bankAmount: 12000,
                color: Colors.black,
                bankIcon: 'ALPOS.png',
              ),
              const AccountCard(
                bankName: 'BDL',
                bankAmount: 7899,
                color: Color.fromRGBO(0, 0, 0, 1),
                bankIcon: 'BDL.webp',
              ),
              const AccountCard(
                bankName: 'Gulf Bank',
                bankAmount: 34000,
                color: Colors.black,
                bankIcon: 'Gulf.jpg',
              ),
              const AccountCard(
                bankName: 'BADR',
                bankAmount: 34000,
                color: Colors.black,
                bankIcon: 'BADR.webp',
              ),
              const Spacer(),

              TextButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const CreateAccountScreen()));
                },
                child: Container(
                  height: 56,
                  width: double.infinity,
                  margin: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: blue,
                    borderRadius: BorderRadius.circular(28),
                  ),
                  child: const Center(
                    child: Text(
                      '+ Add a new account',
                      style: TextStyle(
                        fontSize: 20,
                        color: white,
                        // fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
