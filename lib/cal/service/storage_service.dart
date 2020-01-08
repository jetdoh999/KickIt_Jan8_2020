import 'dart:async';
import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_ui_designs/cal/model/currency.dart';
import 'package:flutter_ui_designs/cal/model/expense.dart';
import 'package:flutter_ui_designs/cal/service/database_helper.dart';

class StorageService {
  static const String _databaseName = "super_simple_budget.db";
  static const String _keyCurrency = "currency";
  static const String _keyBudget = "budget";
  DatabaseHelper dbHelper =  DatabaseHelper();
  SharedPreferences sharedPrefs;

  Future open() async {
    sharedPrefs = await SharedPreferences.getInstance();
    Directory documentDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentDirectory.path, _databaseName);
    return dbHelper.open(path);
  }

  Future<List<Expense>> getCurrentExpenses() async {
    return dbHelper.getAllExpenses();
  }

  Future<Expense> addExpense(Expense expense) {
    return dbHelper.insertExpense(expense);
  }

  Future<Expense> updateExpense(Expense expense) {
    return dbHelper.updateExpense(expense);
  }

  Future<void> deleteExpense(Expense expense) {
    return dbHelper.deleteExpense(expense);
  }

  Future close() async {
    return dbHelper.close();
  }

  Currency getCurrency() {
    return Currency.fromString(sharedPrefs.getString(_keyCurrency));
  }

  void saveCurrency(Currency currency) {
    sharedPrefs.setString(_keyCurrency, currency.toString());
  }

  double getStartingBudget() {
    return sharedPrefs.getDouble(_keyBudget);
  }

  Future saveStartingBudget(double budget, {bool reset = false}) async {
    sharedPrefs.setDouble(_keyBudget, budget);
    if (reset) {
      await dbHelper.deleteAllExpense();
    }
  }
}
