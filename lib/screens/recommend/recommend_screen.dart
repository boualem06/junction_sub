import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:dinar/colors.dart';
import 'package:dinar/controllers/nav_bar_controller.dart';
import 'package:dinar/utils.dart';
import 'package:dinar/widgets/text_button.dart';

class RecommendAnswerScreen extends StatelessWidget {
  final String answer;
  const RecommendAnswerScreen({super.key, required this.answer});

  @override
  Widget build(BuildContext context) {
    return Consumer<NavBarController>(
        builder: (context, navBarController, child) {
      return SafeArea(
        child: Scaffold(
          body: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.all(15),
                  child: Row(
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.pop(context);
                          // navBarController.navigateTo(
                          //     navBarController.navs[2], 2);
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
                        'Topic Details',
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
                const Spacer(),
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    border: Border.all(
                        color: answer.contains("Yes") ? green : red, width: 3),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    answer,
                    style: const TextStyle(
                      fontSize: 25,
                    ),
                  ),
                ),
                const Spacer(),
                const Text('Did that help solve your question?'),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    DinarButton(
                      onPressed: () {},
                      label: 'Yes',
                      width: 60,
                      height: 30,
                    ),
                    const SizedBox(width: 5),
                    DinarButton(
                      onPressed: () {},
                      label: 'No',
                      width: 60,
                      height: 30,
                    ),
                  ],
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
