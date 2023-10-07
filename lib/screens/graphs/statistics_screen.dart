import 'dart:math';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:sh7i7a/colors.dart';
import 'package:sh7i7a/controllers/nav_bar_controller.dart';
import 'package:sh7i7a/controllers/transactionsController.dart';
import 'package:sh7i7a/utils.dart';

class StatsScreen extends StatelessWidget {
  const StatsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<EducationController>(
        builder: (context, educationController, child) {
      return Consumer<TransportController>(
          builder: (context, transportController, child) {
        return Consumer<NutritionController>(
            builder: (context, nutritionController, child) {
          return Consumer<GraphController>(
              builder: (context, graphController, child) {
            return Consumer<NavBarController>(
                builder: (context, navBarController, child) {
              return Container(
                height: double.infinity,
                width: double.infinity,
                color: blue,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 25),
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
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: darkBlue,
                                  ),
                                  child: Transform.rotate(
                                    angle: pi,
                                    child: SvgPicture.asset(
                                      getIcon('arrow'),
                                      width: 15,
                                      color: white,
                                    ),
                                  ),
                                ),
                              ),
                              const Text(
                                'Statistics',
                                style: TextStyle(
                                  fontSize: 19,
                                  color: white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(
                                width: 30,
                              ),
                            ],
                          ),
                          const SizedBox(height: 20),
                          Container(
                            padding: const EdgeInsets.all(13),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: darkBlue,
                            ),
                            child: Row(
                              children: [
                                CircleAvatar(
                                  radius: 25,
                                  backgroundColor: blue,
                                  child: SvgPicture.asset(
                                    getIcon('goal0'),
                                  ),
                                ),
                                const SizedBox(width: 8),
                                const Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Insight',
                                      style: TextStyle(
                                        fontSize: 15,
                                        color: white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      'Last Month',
                                      style: TextStyle(
                                          fontSize: 15,
                                          color: white,
                                          fontWeight: FontWeight.w200),
                                    ),
                                  ],
                                ),
                                const Spacer(),
                                const Column(
                                  children: [
                                    Text(
                                      'DZD 1000',
                                      style: TextStyle(
                                        fontSize: 18,
                                        color: red,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      'DZD 1000',
                                      style: TextStyle(
                                        fontSize: 18,
                                        color: green,
                                      ),
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
                          borderRadius:
                              BorderRadius.vertical(top: Radius.circular(20)),
                          color: white,
                        ),
                        child: Expanded(
                          child: Column(
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(15, 60, 40.0, 20),
                                child: AspectRatio(
                                  aspectRatio: 1,
                                  child: LineChart(
                                    LineChartData(
                                      lineBarsData: [
                                        LineChartBarData(
                                          colors: [red],
                                          isCurved: true,
                                          barWidth: 4,
                                          spots: List.generate(
                                              graphController.data.length,
                                              (index) => FlSpot(
                                                  graphController.data[index].x,
                                                  graphController
                                                      .data[index].y)),
                                          // color: blue,
                                          belowBarData: BarAreaData(
                                              // show: true,
                                              // color: blue.withOpacity(.7),
                                              ),
                                        ),
                                        LineChartBarData(
                                          colors: [green],
                                          isCurved: true,
                                          barWidth: 4,
                                          spots: List.generate(
                                              educationController.data.length,
                                              (index) => FlSpot(
                                                  educationController
                                                      .data[index].x,
                                                  educationController
                                                      .data[index].y)),
                                          // color: blue,
                                          belowBarData: BarAreaData(
                                              // show: true,
                                              // color: blue.withOpacity(.7),
                                              ),
                                        ),
                                        LineChartBarData(
                                          colors: [blue],

                                          isCurved: true,
                                          barWidth: 4,
                                          spots: List.generate(
                                              nutritionController.data.length,
                                              (index) => FlSpot(
                                                  nutritionController
                                                      .data[index].x,
                                                  nutritionController
                                                      .data[index].y)),
                                          // color: blue,
                                          belowBarData: BarAreaData(
                                              // show: true,
                                              // color: blue.withOpacity(.7),
                                              ),
                                        ),
                                        // LineChartBarData(
                                        //   colors: [Colors.yellow],

                                        //   isCurved: true,
                                        //   barWidth: 4,
                                        //   spots: List.generate(
                                        //       transportController.data.length,
                                        //       (index) => FlSpot(
                                        //           transportController
                                        //               .data[index].x,
                                        //           transportController
                                        //               .data[index].y)),
                                        //   // color: blue,
                                        //   belowBarData: BarAreaData(
                                        //       // show: true,
                                        //       // color: blue.withOpacity(.7),
                                        //       ),
                                        // ),
                                      ],
                                      minX: 4,
                                      maxX: 11,
                                      minY: graphController.minY,
                                      maxY: graphController.maxY,
                                      backgroundColor: white,
                                      titlesData: FlTitlesData(
                                        show: true,
                                        bottomTitles: SideTitles(
                                          showTitles: true,
                                          getTitles: (value) {
                                            String text = '';
                                            switch (graphController
                                                .selectedCategory) {
                                              case Category.days:
                                                if (value.toInt() % 5 == 0) {
                                                  text = '${value.toInt()}';
                                                }
                                                break;
                                              case Category.months:
                                                if (value.toInt() % 1 == 0) {
                                                  text = '${value.toInt()}';
                                                }
                                                break;
                                              case Category.years:
                                                if (value.toInt() % 10 == 0 ||
                                                    value.toInt() ==
                                                        DateTime.now().year) {
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
                                          interval:
                                              graphController.maxY / 4 + 1,
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
                                    swapAnimationCurve: Curves.bounceInOut,
                                    swapAnimationDuration:
                                        const Duration(seconds: 3),
                                  ),
                                ),
                              ),
                              const Row(
                                children: [
                                  Spacer(),
                                  CircleAvatar(
                                    radius: 7,
                                    backgroundColor: red,
                                  ),
                                  SizedBox(width: 6),
                                  Text(
                                    'Nutrition',
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: black,
                                      // fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Spacer(),
                                  CircleAvatar(
                                    radius: 7,
                                    backgroundColor: blue,
                                  ),
                                  SizedBox(width: 6),
                                  Text(
                                    'Education',
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: black,
                                      // fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Spacer(),
                                ],
                              ),
                              const Row(
                                children: [
                                  Spacer(),
                                  CircleAvatar(
                                    radius: 7,
                                    backgroundColor: green,
                                  ),
                                  SizedBox(width: 6),
                                  Text(
                                    'Savings',
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: black,
                                      // fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Spacer(),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  // CircleAvatar(
                                  //   radius: 7,
                                  //   backgroundColor: red,
                                  // ),
                                  // SizedBox(width: 6),
                                  // Text(
                                  //   'Transport',
                                  //   style: TextStyle(
                                  //     fontSize: 16,
                                  //     color: black,
                                  //     // fontWeight: FontWeight.bold,
                                  //   ),
                                  // ),
                                  Spacer(),
                                ],
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
          });
        });
      });
    });
  }
}
