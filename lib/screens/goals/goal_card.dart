import 'package:flutter/material.dart';
import 'package:sh7i7a/colors.dart';

class GoalCard extends StatelessWidget {
  final String goalName;
  final int ammount;

  const GoalCard({super.key, required this.goalName, required this.ammount});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(20),
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          // shape: BoxShape.circle,
          borderRadius: BorderRadius.circular(20),
          color: darkBlue,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Monthly Goal',
              style: TextStyle(
                fontSize: 16,
                color: white,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 10),
              child: Row(
                children: [
                  const CircleAvatar(
                    radius: 16,
                  ),
                  const SizedBox(width: 8),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'John Ogaga',
                        style: TextStyle(
                          fontSize: 14,
                          color: white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'Zenith Bank 12:03 AM',
                        style: TextStyle(
                          fontSize: 14,
                          color: white,
                          fontWeight: FontWeight.w200,
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  Text(
                    '${ammount.isNegative ? '-' : '+'}DZD$ammount',
                    style: TextStyle(
                      fontSize: 17,
                      color: ammount.isNegative ? red : green,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(height: 12),
            Container(
              height: 5,
              width: double.infinity,
              alignment: Alignment.centerLeft,
              decoration: BoxDecoration(
                color: green.withOpacity(.5),
                borderRadius: BorderRadius.circular(2.5),
              ),
              child: Container(
                decoration: BoxDecoration(
                  color: green,
                  borderRadius: BorderRadius.circular(2.5),
                ),
                width: 120,
                height: 5,
              ),
            ),
            const SizedBox(height: 12),
            const Text(
              'You are doing realy great!',
              style: TextStyle(
                fontSize: 16,
                color: white,
                fontWeight: FontWeight.bold,
              ),
            )
          ],
        ));
  }
}
