// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:proj2_expense_manageent/providers/provider_class.dart';

import '../Chart_Bar/bar_chart_model.dart';

class Daily extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<charts.Series<BarChartModel, String>> series = [
      charts.Series(
        id: "financial",
        data: Provider.of<ProviderClass>(context).getDataList(),
        domainFn: (BarChartModel series, _) => series.day,
        measureFn: (BarChartModel series, _) => series.expenditure,
        colorFn: (BarChartModel series, _) => series.color,
      ),
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      body: Consumer<ProviderClass>(builder: (context, prov, x) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
              child: SizedBox(
                height: 320,
                child: Expanded(
                  child: charts.BarChart(
                    series,
                    animate: true,
                  ),
                ),
              ),
            ),
            Text('Days'),
            const Divider(
              indent: 10,
              endIndent: 10,
              thickness: 2,
              color: Color.fromARGB(255, 201, 199, 199),
              height: 50,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Monthly Average',
                    style: TextStyle(color: Colors.grey, fontSize: 16),
                  ),
                  Text('Rs.${prov.getAvg()}',
                      style: TextStyle(color: Colors.grey, fontSize: 16)),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Highest Expense (' + prov.getHighestExpense()[1] + ')',
                    style: TextStyle(color: Colors.grey, fontSize: 16),
                  ),
                  Text('Rs. ${prov.getHighestExpense()[0].toString()}',
                      style: TextStyle(color: Colors.grey, fontSize: 16)),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Lowest Expense (' + prov.getLowestExpense()[1] + ')',
                    style: TextStyle(color: Colors.grey, fontSize: 16),
                  ),
                  Text('Rs. ${prov.getLowestExpense()[0].toString()}',
                      style: TextStyle(color: Colors.grey, fontSize: 16)),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 30),
              margin: EdgeInsets.symmetric(vertical: 15),
              height: 70,
              color: Color.fromARGB(179, 231, 231, 231),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Total Expense",
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
                  ),
                  Text('Rs. ${prov.ExpenditureSum1}',
                      style:
                          TextStyle(fontWeight: FontWeight.w600, fontSize: 16))
                ],
              ),
            )
          ],
        );
      }),
    );
  }
}
