class Goal {
  String goalName;
  DateTime goalDate;
  String goalType;
  double fullValue;
  double progress;

  Goal(
      {required this.goalName,
      required this.fullValue,
      required this.progress,
      required this.goalDate,
      required this.goalType});
}

enum GoalType { Spending, Saving }
