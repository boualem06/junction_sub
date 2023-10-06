import 'package:flutter/material.dart';
import 'package:sh7i7a/models/goal.dart';

class GoalsController extends ChangeNotifier {
  //! All Goals
  List<Goal> goals = [];

  //! New Goal
  Goal newGoal =
      Goal(goalName: '', goalDate: DateTime.now(), goalType: 'Saving');

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
