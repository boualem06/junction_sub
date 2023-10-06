import 'package:flutter/material.dart';
import 'package:sh7i7a/screens/goals/goals_screen.dart';
import 'package:sh7i7a/screens/home/home_screen.dart';
import 'package:sh7i7a/screens/recommend/can_i_buy_screen.dart';
import 'package:sh7i7a/screens/stats/stats_screen.dart';

class NavBarController extends ChangeNotifier {
  List<Widget> navs = [
    const HomeScreen(),
    const GoalsScreen(),
    const CanIBuyScreen(),
    const GraphScreen(),
    const Center()
  ];

  List<String> icons = ['home', 'graph', 'can', 'chart', 'profile'];

  int selectedIndex = 0;

  Widget? selectedNav;

  NavBarController() {
    selectedNav = navs.first;
  }

  void navigateTo(Widget nav, int? index) {
    selectedNav = nav;
    if (index != null) {
      selectedIndex = index;
    }
    notifyListeners();
  }
}
