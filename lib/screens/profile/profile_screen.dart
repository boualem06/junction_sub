import 'dart:math';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:sh7i7a/colors.dart';
import 'package:sh7i7a/controllers/nav_bar_controller.dart';
import 'package:sh7i7a/controllers/transactionsController.dart';
import 'package:sh7i7a/screens/profile/settings_screen.dart';
import 'package:sh7i7a/utils.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

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
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 35),
              child: Column(
                children: [
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Profile',
                        style: TextStyle(
                          fontSize: 17,
                          color: white,
                          // fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'Edit Profile',
                        style: TextStyle(
                          fontSize: 17,
                          color: white,
                          // fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Container(
                    padding: const EdgeInsets.all(13),
                    // decoration: BoxDecoration(
                    //   borderRadius: BorderRadius.circular(20),
                    //   color: const Color(0xFF2511BB),
                    // ),
                    child: const Row(
                      children: [
                        CircleAvatar(
                          radius: 25,
                          backgroundColor: green,
                        ),
                        SizedBox(width: 8),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'ABDERRAZAK KENNICHE',
                              style: TextStyle(
                                fontSize: 17,
                                color: white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              'ka_kenniche@esi.dz',
                              style: TextStyle(
                                  fontSize: 14,
                                  color: white,
                                  fontWeight: FontWeight.w200),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                // height: MediaQuery.of(context).size.height * .4,
                width: double.infinity,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                  color: white,
                ),
                child: Expanded(
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 30,
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 5),
                        child: Row(
                          children: [
                            Container(
                              height: 45,
                              width: 45,
                              margin: const EdgeInsets.symmetric(
                                  horizontal: 15, vertical: 2.5),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(9),
                                color: blue.withOpacity(0.3),
                              ),
                              child: SvgPicture.asset(
                                getIcon('account'),
                              ),
                            ),
                            const Text(
                              'My account',
                              style: TextStyle(
                                fontSize: 20,
                                color: black,
                                // fontWeight: FontWeight.w200,
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 5),
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const SettingsScreen()));
                          },
                          child: Row(
                            children: [
                              Container(
                                height: 45,
                                width: 45,
                                margin: const EdgeInsets.symmetric(
                                    horizontal: 15, vertical: 2.5),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(9),
                                  color: blue.withOpacity(0.3),
                                ),
                                child: SvgPicture.asset(
                                  getIcon('settings'),
                                ),
                              ),
                              const Text(
                                'Settings',
                                style: TextStyle(
                                  fontSize: 20,
                                  color: black,
                                  // fontWeight: FontWeight.w200,
                                ),
                              )
                            ],
                          ),
                        ),
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
