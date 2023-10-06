import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:sh7i7a/colors.dart';
import 'package:sh7i7a/controllers/nav_bar_controller.dart';
import 'package:sh7i7a/screens/goals/create_goal_screen.dart';
import 'package:sh7i7a/screens/goals/goal_card.dart';
import 'package:sh7i7a/screens/home/home_screen.dart';
import 'package:sh7i7a/utils.dart';

class GoalsScreen extends StatelessWidget {
  const GoalsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<NavBarController>(
        builder: (context, navBarController, child) {
      return Container(
        height: double.infinity,
        width: double.infinity,
        color: blue,
        child: Column(
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 25),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () {
                          navBarController.navigateTo(
                              navBarController.navs[0], 0);
                        },
                        child: Container(
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: darkBlue,
                          ),
                          child: Transform.rotate(
                            angle: pi,
                            child: SvgPicture.asset(
                              getIcon('arrow'),
                              width: 15,
                            ),
                          ),
                        ),
                      ),
                      Text(
                        'Goals',
                        style: TextStyle(
                          fontSize: 19,
                          color: white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
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
                    ],
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'DZD29,880 left',
                    style: TextStyle(
                      fontSize: 34,
                      color: white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Out of DZD80,888 Goaled',
                    style: TextStyle(
                      fontSize: 15,
                      color: white,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const CreateGoalScreen()));
                    },
                    child: Container(
                      height: 40,
                      width: double.infinity,
                      margin: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: white,
                        borderRadius: BorderRadius.circular(28),
                      ),
                      child: Center(
                        child: Text(
                          '+ New Goal',
                          style: TextStyle(
                            fontSize: 16,
                            color: blue,
                            // fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // const SizedBox(height: 20),
            // const Spacer(),
            Expanded(
              child: Container(
                // height: MediaQuery.of(context).size.height * .4,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius:
                      const BorderRadius.vertical(top: Radius.circular(20)),
                  color: white,
                ),
                child: Expanded(
                  child: ListView(
                    children: const [
                      GoalCard(
                        goalName: 'New Car',
                        ammount: 230000,
                      ),
                      GoalCard(
                        goalName: 'New Car',
                        ammount: 230000,
                      ),
                      GoalCard(
                        goalName: 'New Car',
                        ammount: 230000,
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      );
    });
  }
}
