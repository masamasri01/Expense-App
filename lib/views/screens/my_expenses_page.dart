import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:proj2_expense_manageent/views/screens/Daily.dart';
import 'package:proj2_expense_manageent/views/screens/Monthly.dart';

class MyExpensesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          appBar: AppBar(
            title: Text("My Expenses"),
            centerTitle: true,
            bottomOpacity: 0.9,
            elevation: 0.3,
            backgroundColor: Colors.white,
            bottom: const TabBar(
                indicatorColor: Color.fromRGBO(60, 234, 155, 1),
                indicatorWeight: 10,
                unselectedLabelColor: Colors.grey,
                labelColor: Color.fromRGBO(60, 234, 155, 1),
                tabs: [
                  Tab(
                    text: 'Daily',
                  ),
                  Tab(
                    text: 'Monthly',
                  ),
                ]),
          ),
          body: TabBarView(children: [
            Daily(),
            Monthly(),
          ])),
    );
  }
}
