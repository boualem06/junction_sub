import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sh7i7a/colors.dart';
import 'package:sh7i7a/screens/quotes/day_quote_screen.dart';
import 'package:sh7i7a/utils.dart';

class DayQuote extends StatelessWidget {
  const DayQuote({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const DayQuoteScreen()));
      },
      child: Container(
        width: double.infinity,
        // margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: darkBlue,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  'Quote of the day',
                  style: TextStyle(
                    fontSize: 20,
                    color: white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: SvgPicture.asset(
                    getIcon('arrow'),
                    width: 13,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Text(
              '“Financial freedom is infact freedom from fear”',
              style: TextStyle(
                fontSize: 17,
                color: white,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              '-Robert Kiyosaki',
              style: TextStyle(
                fontSize: 17,
                color: white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
