

import 'dart:math';

import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
// import 'package:money_wallet/data.dart';
// import 'package:money_wallet/service.dart';

class GraphController extends ChangeNotifier {
  Category selectedCategory = Category.years;

  List<DayData> allDays = [];

  void fillAllDays() async {
    allDays = List.generate(
        30,
        (index) => DayData(
            day: DateTime(2023, 10, 30).subtract(Duration(days: index)),
            amount: Random().nextInt(1000).toDouble()));
  }

  GraphController() {
    fillAllDays();
    notifyListeners();
  }

  List<Item> get yearsData {
    List<Item> yList = [];
    double year = 2020;
    while (year <= 2023) {
      double sum = 0;
      Iterable<DayData> yearDays =
          allDays.where((element) => element.day.year == year);
      for (var item in yearDays) {
        sum += item.amount;
      }
      yList.add(Item(x: year, y: sum));
      year++;
    }
    return yList;
  }

  List<Item> get monthsData {
    List<Item> mList = [];

    double month = 1;
    while (month <= DateTime.now().month) {
      double sum = 0;
      Iterable<DayData> monthDays = allDays.where((element) =>
          element.day.year == DateTime.now().year &&
          element.day.month == month);
      for (var item in monthDays) {
        sum += item.amount;
      }
      mList.add(Item(x: month + 1, y: sum));
      month++;
    }
    return mList;
  }

  List<Item> get daysData {
    List<Item> dList = [];

    double day = 1;
    while (day <= DateTime.now().day) {
      double sum = 0;
      Iterable<DayData> dayDays = allDays.where((element) =>
          element.day.year == DateTime.now().year &&
          element.day.month == DateTime.now().month &&
          element.day.day == day);
      for (var item in dayDays) {
        sum += item.amount;
      }
      dList.add(Item(x: day, y: sum));
      day++;
    }
    return dList;
  }

  void changeCategory(Category value) {
    selectedCategory = value;
    notifyListeners();
  }

  void addDayData(DayData dayData) async {
    // await WalletDB.addDay(dayData);
    // print(allDays);
    allDays.add(dayData);
    // fillAllDays();
    notifyListeners();
  }

  double get minX {
    switch (selectedCategory) {
      case Category.days:
        return 1;
      case Category.months:
        return 1;
      case Category.years:
        return 2018;
    }
  }

  double get maxX {
    switch (selectedCategory) {
      case Category.days:
        return 31;
      case Category.months:
        return 12;
      case Category.years:
        return DateTime.now().year.toDouble() + 1;
    }
  }

  double get minY {
    return 0;
  }

  double get maxY {
    switch (selectedCategory) {
      case Category.days:
        double max = 0;
        for (var item in daysData) {
          if (item.y > max) {
            max = item.y + 10;
          }
        }
        return max;
      case Category.months:
        double max = 0;
        for (var item in monthsData) {
          if (item.y > max) {
            max = item.y + 100;
          }
        }
        return max;
      case Category.years:
        double max = 0;
        for (var item in yearsData) {
          if (item.y > max) {
            max = item.y;
          }
        }
        return max + 1000;
    }
  }

  List get data {
    switch (selectedCategory) {
      case Category.days:
        return daysData;
      case Category.months:
        return monthsData;
      case Category.years:
        return yearsData;
    }
  }

  void clearDB() async {
    // await WalletDB.clearDB();
    allDays.clear();
    notifyListeners();
  }

  double get currentValue {
    try {
      daysData.sort((a, b) => a.x > b.x ? 1 : -1);
      if (daysData.last.x == DateTime.now().day) {
        return daysData.last.y;
      }
      return 0;
    } catch (e) {
      return 0;
    }
  }

  double get difference {
    try {
      daysData.sort((a, b) => a.x > b.x ? 1 : -1);
      if (daysData.last.x == DateTime.now().day) {
        return daysData.last.y - daysData[daysData.length - 2].y;
      }
      return -daysData.last.y;
    } catch (e) {
      return 0;
    }
  }
}

enum Category { days, months, years }

// ignore_for_file: public_member_api_docs, sort_constructors_first
// List yearsData = [];
// List monthsData = [];
// List daysData = [];

class Item {
  double x, y;
  Item({
    required this.x,
    required this.y,
  });

  @override
  String toString() => 'Item(x: $x, y: $y)';
}

class DayData {
  DateTime day;
  double amount;
  DayData({
    required this.day,
    required this.amount,
  });
}
