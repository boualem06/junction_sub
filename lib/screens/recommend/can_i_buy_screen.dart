import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:dinar/colors.dart';
import 'package:dinar/controllers/nav_bar_controller.dart';
import 'package:dinar/screens/accounts/create_account_screen.dart';
import 'package:dinar/screens/recommend/recommend_screen.dart';
import 'package:dinar/widgets/text_button.dart';
import 'package:dinar/widgets/text_input.dart';
import 'package:http/http.dart' as http;

class CanIBuyScreen extends StatelessWidget {
  CanIBuyScreen({super.key});

  TextEditingController ctrl = TextEditingController();
  TextEditingController ctrl2 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Consumer<NavBarController>(
        builder: (context, navBarController, child) {
      return SafeArea(
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: blue,
          body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                const Spacer(),
                const Text(
                  'Have something to buy?',
                  style: TextStyle(
                    fontSize: 24,
                    color: white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),
                DinarInput(
                  hintText: 'Paste product link',
                ),
                const SizedBox(height: 20),
                DinarInput(
                  controller: ctrl,
                  hintText: 'Describe your product',
                  maxLines: 15,
                ),
                const SizedBox(height: 20),
                DinarInput(
                  controller: ctrl2,
                  hintText: 'Your product price',
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(height: 20),
                DinarButton(
                  onPressed: () async {
                    // navBarController.navigateTo(
                    //     const RecommendAnswerScreen(), 2);
                    print('object');
                    final response = await http.post(
                      Uri.parse("https://july-q0xh.onrender.com/recommend"),
                      headers: {"Content-Type": "application/json"},
                      body: jsonEncode({
                        "monthly_income": 6000,
                        "account": 100000,
                        "spend": 1000,
                        "monthly_save": 2000,
                        "product_description": ctrl.text,
                        "product_price": int.parse(ctrl2.text)
                      }),
                    );
                    if (response.statusCode == 200) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => RecommendAnswerScreen(
                                    answer: response.body.toString(),
                                  )));
                    }
                  },
                  label: 'Can I Buy This?',
                  color: white,
                  height: 50,
                  width: 160,
                  btnTextColor: blue,
                ),
                const Spacer(),
              ],
            ),
          ),
        ),
      );
    });
  }
}
