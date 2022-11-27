import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:proj2_expense_manageent/providers/provider_class.dart';
import 'package:proj2_expense_manageent/views/widgets/TodayExpenditure.dart';
import 'package:proj2_expense_manageent/views/widgets/all_spendings.dart';
import 'package:provider/provider.dart';

class Monthly extends StatelessWidget {
  DateTime _selectedDate = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return Consumer<ProviderClass>(builder: (context, prov, x) {
      return Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            Container(
                height: 100,
                margin: const EdgeInsets.all(1),
                child: DatePicker(
                  DateTime.parse("2022-${DateTime.now().month}-15"),
                  height: 100,
                  width: 80,
                  selectionColor: Theme.of(context).primaryColor,
                  daysCount: 32,
                  dateTextStyle: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: Colors.grey),
                  onDateChange: (selectedDate) {
                    prov.changeSelectedDate(selectedDate);
                  },
                )),
            SizedBox(
              height: 10,
            ),
            AllExpensesScreen(dt: prov.selectedDate),
            TodayExpenditure(dt: prov.selectedDate)
          ],
        ),
      );
    });
  }
}
