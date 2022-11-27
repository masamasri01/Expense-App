import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:proj2_expense_manageent/functions/get_date_style.dart';
import 'package:proj2_expense_manageent/views/widgets/all_spendings.dart';
import 'package:proj2_expense_manageent/views/widgets/foating_point.dart';
import 'package:provider/provider.dart';

import '../../providers/provider_class.dart';
import '../widgets/Spending_widget.dart';
import '../widgets/TodayExpenditure.dart';
import '../widgets/bottm_nav.dart';
import '../widgets/daily_avg.dart';

class MyHomePage extends StatelessWidget {
  DateTime dd = DateTime.parse("2022-11-26");
  @override
  Widget build(BuildContext context) {
    DateTime today = Provider.of<ProviderClass>(context).today;

    return Scaffold(
        appBar: AppBar(
            centerTitle: true,
            bottomOpacity: 0.4,
            title: Text(
              'Home',
            ),
            backgroundColor: Colors.white),
        backgroundColor: Colors.white,
        floatingActionButton: Float(),
        body: Consumer<ProviderClass>(builder: (context, prov, x) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            //  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                padding: EdgeInsets.only(left: 15, top: 20, bottom: 15),
                child: Text(
                  getDateToday(today),
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
              AllExpensesScreen(dt: today),
              //Text(DateTime.now().toString()),
              TodayExpenditure(
                dt: today,
              ),
              DailyAvg(amount: prov.getAvg()),
            ],
          );
        }));
  }
}
