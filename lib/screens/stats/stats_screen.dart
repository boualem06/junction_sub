// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:sh7i7a/controllers/nav_bar_controller.dart';
// import 'package:sh7i7a/controllers/transactionsController.dart';
// import 'package:sh7i7a/screens/stats/graph.dart';

// class StatsScreen extends StatelessWidget {
//   const StatsScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Consumer<TransactionController>(
//         builder: (context, transactionController, child) {
//       return Scaffold(
//         body: SizedBox(
//           height: 400,
//           width: double.infinity,
//           child: TransactionGraph(
//             graphData: transactionController.graphData,
//           ),
//         ),
//       );
//     });
//   }
// }

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sh7i7a/colors.dart';
import 'package:sh7i7a/controllers/transactionsController.dart';

class GraphScreen extends StatelessWidget {
  const GraphScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<GraphController>(
      builder: (_, graphController, child) {
        return SafeArea(
          child: Scaffold(
            resizeToAvoidBottomInset: false,
            backgroundColor: Colors.black,
            /* bottomNavigationBar: BottomNavigationBar(
              currentIndex: 1,
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.home,
                    color: Colors.grey,
                    size: 25,
                  ),
                  label: 'Summary',
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.add_circle_outline_outlined,
                    color: Colors.grey,
                    size: 40,
                  ),
                  label: '',
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.restart_alt_outlined,
                    color: Colors.grey,
                    size: 25,
                  ),
                  label: 'Clear',
                ),
              ],
              showSelectedLabels: false,
              backgroundColor: const Color(0xFF444444),
              unselectedItemColor: Colors.grey,
              showUnselectedLabels: true,
              onTap: (index) async {
                if (index == 1) {
                  await showModalBottomSheet(
                    isScrollControlled: true,
                    context: context,
                    builder: (context) => const Center(),
                  );
                }
                if (index == 2) {
                  await showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        backgroundColor: blue.withOpacity(.4),
                        title: const Text('Do you want to clear your data?'),
                        actions: [
                          TextButton(
                            child: const Text('No'),
                            onPressed: () {
                              // Perform the action when "No" button is pressed
                              Navigator.of(context).pop(false);
                            },
                          ),
                          TextButton(
                            child: const Text('Yes'),
                            onPressed: () {
                              // Perform the action when "Yes" button is pressed
                              graphController.clearDB();
                              Navigator.of(context).pop(true);
                            },
                          ),
                        ],
                      );
                    },
                  );
                }
              },
            ),*/
            body: Column(
              children: [
                const SizedBox(height: 20),
                const Text(
                  'CURRENT VALUE',
                  style: TextStyle(
                    fontSize: 19,
                    color: Colors.white54,
                  ),
                ),
                Text(
                  'US\$ ${graphController.currentValue}',
                  style: const TextStyle(
                    fontSize: 25,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 10),
                if (graphController.selectedCategory == Category.days)
                  const Text(
                    'COMPARING TO THE PREVIOUS PERIOD',
                    style: TextStyle(
                      fontSize: 19,
                      color: Colors.white54,
                    ),
                  ),
                if (graphController.selectedCategory == Category.days)
                  Text(
                    '+US\$${graphController.difference}',
                    style: TextStyle(
                      fontSize: 22,
                      color: graphController.difference >= 0
                          ? const Color.fromARGB(255, 67, 105, 31)
                          : Colors.red,
                    ),
                  ),
                const SizedBox(height: 15),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: const Color(0xFF1D1D1F),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      InkWell(
                        onTap: () {
                          graphController.changeCategory(Category.days);
                        },
                        child: Container(
                          height: 40,
                          width: 100,
                          padding: const EdgeInsets.all(8),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: graphController.selectedCategory ==
                                    Category.days
                                ? const Color(0xFF646466)
                                : const Color(0xFF1D1D1F),
                          ),
                          child: const Text(
                            'Days',
                            style: TextStyle(
                              fontSize: 19,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          graphController.changeCategory(Category.months);
                        },
                        child: Container(
                          height: 40,
                          width: 100,
                          padding: const EdgeInsets.all(8),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: graphController.selectedCategory ==
                                    Category.months
                                ? const Color(0xFF646466)
                                : const Color(0xFF1D1D1F),
                          ),
                          child: const Text(
                            'Months',
                            style: TextStyle(
                              fontSize: 19,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          graphController.changeCategory(Category.years);
                        },
                        child: Container(
                          height: 40,
                          width: 100,
                          padding: const EdgeInsets.all(8),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: graphController.selectedCategory ==
                                    Category.years
                                ? const Color(0xFF646466)
                                : const Color(0xFF1D1D1F),
                          ),
                          child: const Text(
                            'Years',
                            style: TextStyle(
                              fontSize: 19,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(15, 60, 40.0, 20),
                  child: AspectRatio(
                    aspectRatio: 1,
                    child: LineChart(
                      LineChartData(
                        lineBarsData: [
                          LineChartBarData(
                            spots: List.generate(
                                graphController.data.length,
                                (index) => FlSpot(graphController.data[index].x,
                                    graphController.data[index].y)),
                            // color: blue,
                            belowBarData: BarAreaData(
                              show: true,
                              // color: blue.withOpacity(.7),
                            ),
                          ),
                        ],
                        minX: graphController.minX,
                        maxX: graphController.maxX,
                        minY: graphController.minY,
                        maxY: graphController.maxY,
                        backgroundColor: Colors.black,
                        titlesData: FlTitlesData(
                          show: true,
                          bottomTitles: SideTitles(
                            showTitles: true,
                            getTitles: (value) {
                              String text = '';
                              switch (graphController.selectedCategory) {
                                case Category.days:
                                  if (value.toInt() % 5 == 0) {
                                    text = '${value.toInt()}';
                                  }
                                  break;
                                case Category.months:
                                  if (value.toInt() % 3 == 0) {
                                    text = '${value.toInt()}';
                                  }
                                  break;
                                case Category.years:
                                  if (value.toInt() % 10 == 0 ||
                                      value.toInt() == DateTime.now().year) {
                                    text = '${value.toInt()}';
                                  }
                                  break;
                              }

                              // return Text(
                              return text;
                              // style:
                              // const TextStyle(
                              //   fontSize: 14,
                              //   color: Colors.white,
                              // ),
                              // );
                            },
                          ),
                          leftTitles: SideTitles(
                            showTitles: true,
                            interval: graphController.maxY / 4 + 1,
                            getTitles: (value) {
                              String text = '';
                              if (value.toInt() > 1000) {
                                text =
                                    '${(value.toInt() / 1000).toStringAsFixed(1)}k';
                              } else {
                                text = '${value.toInt()}';
                              }
                              // switch (graphController.selectedCategory) {
                              //   case Category.days:
                              //     text = '${value.toInt()}';

                              //     break;
                              //   case Category.months:
                              //     text = '${value.toInt() ~/ 1000}k';
                              //     break;
                              //   case Category.years:
                              //     text = '${value.toInt() ~/ 1000}k';
                              //     break;
                              // }
                              // return Text(
                              return text;
                              //   style: const TextStyle(
                              //     fontSize: 11,
                              //     color: Colors.white,
                              //   ),
                              // );
                            },
                          ),
                          rightTitles: SideTitles(
                            showTitles: false,

                            // axisNameWidget: null,
                          ),
                          topTitles: SideTitles(
                            showTitles: false,
                            // axisNameWidget: null,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

// Color mainClr = const Color(0xFFB85DEF), altClr = const Color(0xFF4B245F);

