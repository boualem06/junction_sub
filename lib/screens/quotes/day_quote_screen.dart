import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:dinar/colors.dart';
import 'package:dinar/utils.dart';

class DayQuoteScreen extends StatelessWidget {
  const DayQuoteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: blue,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
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
                  Text(
                    'Quote of the day',
                    style: TextStyle(
                      fontSize: 24,
                      color: white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const Spacer(),
              Text(
                '“Financial freedom is infact freedom from fear”',
                style: TextStyle(
                  fontSize: 22,
                  color: white,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                '-Robert Kiyosaki',
                style: TextStyle(
                  fontSize: 20,
                  color: white,
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
