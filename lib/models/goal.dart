class Goal {
  String goalName;
  DateTime goalDate;
  String goalType;

  Goal(
      {required this.goalName, required this.goalDate, required this.goalType});
}

enum GoalType { Spending, Saving }
