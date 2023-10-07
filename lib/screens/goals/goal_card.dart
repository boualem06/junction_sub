import 'package:flutter/material.dart';
import 'package:dinar/colors.dart';
import 'package:dinar/models/goal.dart';

class GoalCard extends StatelessWidget {
  final Goal goal;

  const GoalCard({super.key, required this.goal});

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
            Text(
              goal.goalName,
              style: const TextStyle(
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
                        'Ahmed Hichem',
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
                    '${goal.goalType == 'Spending' ? '-' : '+'}DZD${goal.fullValue}',
                    style: TextStyle(
                      fontSize: 17,
                      color: goal.goalType == 'Spending' ? red : green,
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
                color: goal.goalType == 'Spending'
                    ? red.withOpacity(.5)
                    : green.withOpacity(.5),
                borderRadius: BorderRadius.circular(2.5),
              ),
              child: Container(
                decoration: BoxDecoration(
                  color: goal.goalType == 'Spending' ? red : green,
                  borderRadius: BorderRadius.circular(2.5),
                ),
                width: 320 * goal.progress,
                height: 5,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              goal.goalType == 'Spending'
                  ? 'Take attention to your spending'
                  : 'You are doing realy great!',
              style: const TextStyle(
                fontSize: 16,
                color: white,
                fontWeight: FontWeight.bold,
              ),
            )
          ],
        ));
  }
}
