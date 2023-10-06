import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:sh7i7a/colors.dart';
import 'package:sh7i7a/controllers/goals_controller.dart';
import 'package:sh7i7a/controllers/nav_bar_controller.dart';
import 'package:sh7i7a/models/goal.dart';
import 'package:sh7i7a/utils.dart';
import 'package:sh7i7a/widgets/select_input.dart';

class CreateGoalScreen extends StatelessWidget {
  const CreateGoalScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Screen1Per3();
  }
}

class Screen1Per3 extends StatelessWidget {
  Screen1Per3({super.key});

  final TextEditingController _ctrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Consumer<NavBarController>(
      builder: (context, navBarController, child) {
        return Consumer<GoalsController>(
          builder: (context, goalsController, child) {
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
                              '1 / 2',
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
                      const Text('Create your Goal'),
                      const Text(
                          'Set the maximum you’d like to spend each week or month? Type in the amount below'),
                      TextField(
                        controller: _ctrl,
                      ),
                      Container(
                        // height: 60,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 5),
                        width: double.infinity,
                        alignment: Alignment.centerLeft,
                        decoration: BoxDecoration(
                            color: white,
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(
                              width: 1,
                            )),
                        child: const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Goal name'),
                            TextField(
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.zero,
                                border: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        // height: 60,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 5),
                        width: double.infinity,
                        alignment: Alignment.centerLeft,
                        decoration: BoxDecoration(
                          color: white,
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(
                            width: 1,
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text('Goal Type'),
                            SelectInput(
                              title: 'Spending',
                              items: const ['Spending', 'Saving'],
                              onSelect: (String value) {
                                goalsController.editGoalType(value);
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}

class Screen2Per3 extends StatelessWidget {
  const Screen2Per3({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

class Screen3Per3 extends StatelessWidget {
  const Screen3Per3({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
