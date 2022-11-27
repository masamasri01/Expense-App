import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:proj2_expense_manageent/DB_helper/database.dart';
import 'package:proj2_expense_manageent/functions/check_same_date.dart';
import 'package:proj2_expense_manageent/functions/get_date_style.dart';
import 'package:proj2_expense_manageent/models/expense_model.dart';

import '../views/Chart_Bar/bar_chart_model.dart';

class ProviderClass extends ChangeNotifier {
  int ExpenditureSum = 0; /////
  int ExpenditureSum1 = 0;
  TextEditingController title = TextEditingController();
  TextEditingController descreotion = TextEditingController();
  TextEditingController amount = TextEditingController();
  DateTime date = DateTime.now();
  int pageIndex = 0;
  DateTime today = DateTime.now();
  late TabController pageController = pageController;
  DateTime selectedDate = DateTime.now();
  ProviderClass() {
    getAllExpenses();
  }
  changePageIndex(int indx) async {
    pageIndex = indx;
    notifyListeners();
  }

  List<ExpenseModel> allExpenses = [];
  getAllExpenses() async {
    allExpenses = await DbHelper.dbHelper.getAllExpenses();

    today = DateTime.now();
    notifyListeners();
  }

  getExpenditureOfDate(DateTime dt) {
    ExpenditureSum = 0;
    ExpenditureSum1 = 0;

    for (int i = 0; i < allExpenses.length; i++) {
      if (checkSameDate(allExpenses[i].date, dt)) {
        ExpenditureSum += int.parse(allExpenses[i].amount!);
      }
    }
    for (int i = 0; i < allExpenses.length; i++) {
      ExpenditureSum1 += int.parse(allExpenses[i].amount!);
    }
    getAvg();
    return ExpenditureSum;
  }

  getExpenditureAll() async {
    ExpenditureSum1 = 0;
    for (int i = 0; i < allExpenses.length; i++) {
      ExpenditureSum1 += int.parse(allExpenses[i].amount!);
    }
    getAvg();
    return ExpenditureSum1;
  }

  insertExpense() async {
    ExpenseModel expenseModel = ExpenseModel(
        title: title.text,
        descreption: descreotion.text,
        amount: amount.text,
        date: DateTime.parse("${date.year}-${date.month}-${date.day}"));

    await DbHelper.dbHelper.insertNewExpense(expenseModel);
    title.clear;
    descreotion.clear();
    amount.clear;
    notifyListeners();
    getAllExpenses();
  }

  changeSelectedDate(DateTime sel) {
    selectedDate = sel;
    notifyListeners();
  }

  /**
   * daily tab
   */
  List<Map<String, dynamic>> mylist = [
    {},
    {},
    {},
    {},
    {},
    {},
    {},
    {},
    {},
    {},
    {},
    {},
  ];
  fillListOfMaps() {
    for (int i = 0; i < 12; i++) {
      mylist[i] = {
        'day': (i + 17).toString(),
        'expenditure': getExpenditureOfDate(DateTime.parse("2022-11-${i + 17}"))
      };
    }
  }

  List<BarChartModel> data = [];
  fillListOfChart() {
    data = mylist.map((e) {
      return BarChartModel.fromMap(e);
    }).toList();
  }

  getDataList() {
    fillListOfMaps();
    fillListOfChart();
    return data;
  }

  int sum = 0;
  getAvg() {
    if (data.isEmpty) {
      return 0;
    } else {
      sum = 0;
      for (int i = 0; i < data.length; i++) {
        sum += data[i].expenditure;
      }
      return (sum / data.length).toString().split(".")[0];
    }
  }

  List<dynamic> getHighestExpense() {
    List<dynamic> tmp = [0, 'i'];
    tmp[0] = data[0].expenditure;
    for (int i = 1; i < data.length; i++) {
      if (data[i].expenditure > tmp[0]) {
        tmp[0] = data[i].expenditure;
        tmp[1] = getDateToday(DateTime.parse("2022-11-${data[i].day}"));
      }
    }
    return tmp;
  }

  List<dynamic> getLowestExpense() {
    List<dynamic> tmp = [0, 'i'];
    tmp[0] = data[0].expenditure;
    for (int i = 1; i < data.length; i++) {
      if (data[i].expenditure <= tmp[0]) {
        tmp[0] = data[i].expenditure;
        tmp[1] = getDateToday(DateTime.parse("2022-11-${data[i].day}"));
      }
    }
    return tmp;
  }
}
