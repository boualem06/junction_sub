import 'package:flutter/material.dart';
import 'package:sh7i7a/models/goal.dart';

class GoalsController extends ChangeNotifier {
  //! All Goals
  List<Goal> goals = [
    Goal(
        goalName: 'New Laptop (Macbook)',
        goalDate: DateTime.now().subtract(const Duration(
          days: 120,
        )),
        fullValue: 150000,
        progress: .5,
        goalType: 'Saving'),
    Goal(
        goalName: 'Fast Food Limit',
        goalDate: DateTime.now().subtract(const Duration(
          days: 120,
        )),
        fullValue: 10000,
        progress: .7,
        goalType: 'Spending'),
    Goal(
        goalName: 'Limit My Subscriptions',
        goalDate: DateTime.now().subtract(const Duration(
          days: 120,
        )),
        fullValue: 20000,
        progress: .3,
        goalType: 'Spending'),
  ];

  //! New Goal
  Goal newGoal = Goal(
      fullValue: 0,
      progress: 0,
      goalName: '',
      goalDate: DateTime.now(),
      goalType: 'Saving');

  void editGoalName(String name) {
    newGoal.goalName = name;
    notifyListeners();
  }

  void editGoalType(String type) {
    newGoal.goalType = type;
    notifyListeners();
  }

  void editGoalDate(DateTime date) {
    newGoal.goalDate = date;
    notifyListeners();
  }

  void addGoal() {
    goals.add(newGoal);
    notifyListeners();
  }
}
