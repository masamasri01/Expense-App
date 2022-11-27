import 'dart:developer';
import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

import '../models/expense_model.dart';

class DbHelper {
  late Database database;
  static DbHelper dbHelper = DbHelper();

  final String tableName = "expenses2";
  final String idColumnName = "id";
  final String titleColumnName = "title";
  final String descriptionColumnName = "descreption";
  final String amountColumnName = "amount";
  final String date = "date";

  initDatabase() async {
    database = await createDatabaseConnection();
  }

  Future<Database> createDatabaseConnection() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String folderPath = directory.path;
    return openDatabase('$folderPath/expenses2.db', version: 1,
        onCreate: (db, version) {
      db.execute('''CREATE TABLE $tableName (
            $idColumnName INTEGER PRIMARY KEY AUTOINCREMENT,
            $titleColumnName TEXT,
            $descriptionColumnName TEXT,
            $amountColumnName TEXT,
            $date TEXT)'''); //"2012-02-27 format"
      log('created table:)');
    });
  }

  Future<int> insertNewExpense(ExpenseModel expenseModel) async {
    int i = await database.insert(tableName, expenseModel.toMap());
    log('inserted $i');
    return i;
  }

  Future<List<ExpenseModel>> getAllExpenses() async {
    List<Map<String, dynamic>> data = await database.query(tableName);
    log(data.length.toString());
    return data.map((e) => ExpenseModel.fromMap(e)).toList();
  }

  getTables() async {
    final tables =
        await database.rawQuery('SELECT * FROM sqlite_master ORDER BY name;');
    log(tables.toString());
  }
}
