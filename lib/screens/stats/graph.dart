import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:sh7i7a/colors.dart';
import 'package:sh7i7a/models/transaction.dart';
import 'package:intl/intl.dart';

// class TransactionGroup {
//   final DateTime date;
//   final List<Transaction> transactions;

//   TransactionGroup({required this.date, required this.transactions});
// }

// List<TransactionGroup> groupTransactionsByDate(
//     List<Transaction> transactions) {
//   final groupedMap = <DateTime, List<Transaction>>{};
//   for (final transaction in transactions) {
//     final date = DateTime(transaction.transactionDate.year,
//         transaction.transactionDate.month, transaction.transactionDate.day);
//     if (groupedMap.containsKey(date)) {
//       groupedMap[date]!.add(transaction);
//     } else {
//       groupedMap[date] = [transaction];
//     }
//   }

//   return groupedMap.entries
//       .map((entry) =>
//           TransactionGroup(date: entry.key, transactions: entry.value))
//       .toList();
// }

class TransactionGraph extends StatelessWidget {
  final List<Transaction> graphData;

  const TransactionGraph({
    super.key,
    required this.graphData,
  });

  @override
  Widget build(BuildContext context) {
    final List<FlSpot> dataSpots = [];
    final List<String> bottomTitles = [];

    if (graphData.isEmpty) {
      return const Center(
        child: Text(
          'No available data',
          style: TextStyle(fontSize: 16, color: Colors.grey),
        ),
      );
    } else {
      for (int i = 0; i < graphData.length; i++) {
        final Map<String, dynamic> dataPoint = graphData[i].toMap();
        final DateTime date = DateTime.parse(dataPoint['date']);
        final double value = dataPoint['amount'].toDouble();

        dataSpots.add(FlSpot(i.toDouble(), value));

        final String formattedDate = DateFormat('E')
            .format(date); // E is for the day of the week abbreviation

        bottomTitles.add(formattedDate);
      }
      return Container(
        height: 150,
        padding: const EdgeInsets.all(20),
        child: LineChart(
          LineChartData(
            gridData: FlGridData(
              show: true,
            ),
            borderData: FlBorderData(
              show: false,
            ),
            titlesData: FlTitlesData(
              bottomTitles: SideTitles(
                showTitles: true,
                reservedSize: 20,
                interval: 1,
                getTextStyles: (context, value) => const TextStyle(
                  color: blue,
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                ),
                getTitles: (value) {
                  if (value.isInfinite || value.isNaN) {
                    return '';
                  }
                  final intValue = value.toInt();
                  if (intValue < 0 || intValue >= bottomTitles.length) {
                    return '';
                  }
                  return bottomTitles[intValue];
                },
              ),
              leftTitles: SideTitles(showTitles: false),
              topTitles: SideTitles(showTitles: false),
              rightTitles: SideTitles(showTitles: false),
            ),
            lineBarsData: [
              LineChartBarData(
                spots: dataSpots,
                isCurved: false,
                barWidth: 2,
                dotData: FlDotData(
                  show: false,
                ),
                colors: [
                  Colors.blue,
                ],
                belowBarData: BarAreaData(
                  show: true,
                  colors: [
                    Colors.red.withOpacity(0.7),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    }
  }
}
