import 'package:dinar/controllers/bank_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:dinar/controllers/goals_controller.dart';
import 'package:dinar/controllers/nav_bar_controller.dart';
import 'package:dinar/controllers/settings_controller.dart';
import 'package:dinar/controllers/transactionsController.dart';
import 'package:dinar/screens/main_app.dart';

void main() {
  runApp(
    const dinarApp(),
  );
}

class dinarApp extends StatelessWidget {
  const dinarApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<NavBarController>(
          create: (context) => NavBarController(),
        ),
        ChangeNotifierProvider<GoalsController>(
          create: (context) => GoalsController(),
        ),
        ChangeNotifierProvider<SettingsController>(
          create: (context) => SettingsController(),
        ),
        ChangeNotifierProvider<GoalsController>(
          create: (context) => GoalsController(),
        ),
        ChangeNotifierProvider<GraphController>(
          create: (context) => GraphController(),
        ),
        ChangeNotifierProvider<TransportController>(
          create: (context) => TransportController(),
        ),
        ChangeNotifierProvider<NutritionController>(
          create: (context) => NutritionController(),
        ),
        ChangeNotifierProvider<EducationController>(
          create: (context) => EducationController(),
        ),
        ChangeNotifierProvider<BankController>(
          create: (context) => BankController(),
        ),
      ],
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            fontFamily: 'Roboto',
          ),
          home: const MainApp(),
        );
      },
    );
  }
}

class SetttingsController {}
