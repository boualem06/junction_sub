import 'package:flutter/material.dart';
import 'package:sh7i7a/screens/home/home_screen.dart';

class NavBarController extends ChangeNotifier {
  List<Widget> navs = [
    const HomeScreen(),
    const Center(),
    const Center(),
    const Center()
  ];

  List<String> icons = ['home', 'graph', 'chart', 'profile'];

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
