import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sh7i7a/controllers/goals_controller.dart';
import 'package:sh7i7a/controllers/nav_bar_controller.dart';
import 'package:sh7i7a/controllers/transactionsController.dart';
import 'package:sh7i7a/screens/main_app.dart';

void main() {
  runApp(
    const Sh7i7aApp(),
  );
}

class Sh7i7aApp extends StatelessWidget {
  const Sh7i7aApp({super.key});

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
        ChangeNotifierProvider<GraphController>(
          create: (context) => GraphController(),
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
