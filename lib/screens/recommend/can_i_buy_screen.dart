import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sh7i7a/colors.dart';
import 'package:sh7i7a/controllers/nav_bar_controller.dart';
import 'package:sh7i7a/screens/recommend/recommend_screen.dart';
import 'package:sh7i7a/widgets/text_button.dart';
import 'package:sh7i7a/widgets/text_input.dart';
import 'package:http/http.dart' as http;

class CanIBuyScreen extends StatelessWidget {
  const CanIBuyScreen({super.key});

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
                  hintText: 'Describe your product',
                  maxLines: 15,
                ),
                const SizedBox(height: 20),
                DinarButton(
                  onPressed: () async {
                    // navBarController.navigateTo(
                    //     const RecommendAnswerScreen(), 2);
                    final response = await http.post(
                      Uri.parse("http://127.0.0.1:5000/recommend"),
                      body: jsonEncode({
                        "monthly_income": 6000,
                        "account": 100000,
                        "spend": 1000,
                        "monthly_save": 2000,
                        "product_description": 'Milk for babies',
                        "product_price": 5
                      }),
                    );
                    print(response.body);
                    if (response.statusCode == 200) print('Hi');
                  },
                  label: 'Can I Buy This?',
                  color: white,
                  height: 50,
                  btnTextColor: blue,
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
