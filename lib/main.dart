import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:proj2_expense_manageent/DB_helper/database.dart';
import 'package:proj2_expense_manageent/models/color_codes.dart';
import 'package:proj2_expense_manageent/models/expense_model.dart';
import 'package:proj2_expense_manageent/providers/provider_class.dart';
import 'package:proj2_expense_manageent/views/screens/home.dart';
import 'package:proj2_expense_manageent/views/screens/main_Screen.dart';
import 'package:proj2_expense_manageent/views/screens/splach.dart';
import 'package:proj2_expense_manageent/views/widgets/Spending_widget.dart';
import 'package:proj2_expense_manageent/views/widgets/TodayExpenditure.dart';
import 'package:proj2_expense_manageent/views/widgets/bottm_nav.dart';
import 'package:proj2_expense_manageent/views/widgets/daily_avg.dart';
import 'package:proj2_expense_manageent/views/widgets/float_button.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DbHelper.dbHelper.initDatabase();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ProviderClass>(
        create: (context) {
          return ProviderClass();
        },
        child: AppInit());
  }
}

class AppInit extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Expense App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: MaterialColor(0xE304EA9B, colorCodes),
      ),
      home: MainScreen(),
    );
  }
}
