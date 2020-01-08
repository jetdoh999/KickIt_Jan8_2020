import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:flutter_ui_designs/cal/generated/i18n.dart';
import 'package:flutter_ui_designs/cal/model/currency.dart';
import 'package:flutter_ui_designs/cal/model/expense.dart';
import 'package:flutter_ui_designs/cal/service/storage_service.dart';
import 'package:flutter_ui_designs/cal/widget/card_to_spend.dart';
import 'package:flutter_ui_designs/cal/widget/change_budget_dialog.dart';
import 'package:flutter_ui_designs/cal/widget/expense_history_row.dart';
import 'package:flutter_ui_designs/cal/widget/history_divider.dart';
import 'package:flutter_ui_designs/cal/widget/input_expense_row.dart';
import 'package:flutter_ui_designs/cal/widget/minor_value_card.dart';
import 'package:flutter_ui_designs/cal/widget/new_cycle_dialog.dart';

class MainPage extends StatefulWidget {
  final StorageService storageService;

  MainPage({Key key, this.storageService}) : super(key: key);

  @override
  _MainPageState createState() =>  _MainPageState();
}

class _MainPageState extends State<MainPage> {
  double startBudget = 0.0;
  List<Expense> expenses = [];
  Currency currency;

  double get spent => expenses.fold(0.0, (sum, expense) => sum + expense.value);
  
  double get leftToSpend => startBudget - spent;
  

  @override
  void initState() {
    super.initState();
    initializeDateFormatting();
    _loadExpenses();
    this.currency = widget.storageService.getCurrency();
    this.startBudget = widget.storageService.getStartingBudget() ?? 0.0;
    
  }

  void _loadExpenses() {
    widget.storageService.getCurrentExpenses().then((result) => setState(() =>
        expenses = result
          ..sort((ex1, ex2) => ex2.dateTime.compareTo(ex1.dateTime))));
  }



  void _addExpense(Expense expense) {
    widget.storageService.addExpense(expense);
    setState(() {
      expenses.insert(0, expense);
    });
  }




  void _updateExpense(Expense expense) async {
    Expense updatedExpense = await widget.storageService.updateExpense(expense);
    int index = expenses.indexOf(expense);
    setState(() {
      expenses.replaceRange(index, index + 1, [updatedExpense]);
    });
  }


  void _deleteExpense(Expense expense) {
    widget.storageService.deleteExpense(expense);
    setState(() {
      expenses.remove(expense);
    });
  }


  void _openCurrencyDialog() async {
    Currency currency = await showDialog(
        context: context,
        builder: (context) {
          return  SimpleDialog(
            title:  Text(S.of(context).chooseCurrency),
            children: Currency.currencies
                .map(
                  (currency) =>  SimpleDialogOption(
                    onPressed: () => Navigator.of(context).pop(currency),
                    child:  ListTile(
                      selected: currency == this.currency,
                      title:  Text(currency.getName(context)),
                    ),
                  ),
                )
                .toList(),
          );
        });
    if (currency != null) {
      widget.storageService.saveCurrency(currency);
      setState(() {
        this.currency = currency;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar:  AppBar(
        key:  Key("app_bar"),
        centerTitle: true,
        title:  Text(S.of(context).appTitle),
        actions: <Widget>[
           PopupMenuButton<String>(
            onSelected: (val) {
              switch (val) {
                case 'CURRENCY':
                  _openCurrencyDialog();
                  break;
                case 'NEW_CYCLE':
                  _openNewCycleDialog();
                  break;
              }
            },
            itemBuilder: (BuildContext context) => <PopupMenuItem<String>>[
               PopupMenuItem<String>(
                value: 'NEW_CYCLE',
                child:  Text(S.of(context).settozero),
              ),
               
            ],
          ),
        ],
      ),


      body:  SingleChildScrollView(
        child:  Padding(
          padding: const EdgeInsets.all(16.0),
          child:  Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                   Expanded(
                    child:  MinorValueCard(
                      value: spent,
                      label: S.of(context).totalmatchdata,
                      currency: currency,
                    ),
                  ),
                ],
              ),

               InputExpenseRow(
                onClick: _addExpense,
              ),
               Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                   Expanded(
                    child:  MinorValueCard(
                      value: spent,
                      label: S.of(context).totalmatchdata1,
                      currency: currency,
                    ),
                  ),
                ],
              ),


              InputExpenseRow(
                onClick: _addExpense,
              ),

               HistoryDivider(),
               Column(
                children: expenses.map((expense) {
                  return ExpenseHistoryRow(
                    onUpdated: _updateExpense,
                    onDismissed: _deleteExpense,
                    expense: expense,
                    currency: currency,
                  );
                }).toList(),
              )
            ],
          ),
        ),
      ),
    );
  }

  void _openChangeBudgetDialog() async {
    double newBudget = await showDialog<double>(
      context: context,
      builder: (context) =>  ChangeBudgetDialog(previousBudget: startBudget),
    );
    if (newBudget != null) {
      await widget.storageService.saveStartingBudget(newBudget, reset: false);
      setState(() {
        this.startBudget = newBudget;
      });
    }
  }

  void _openNewCycleDialog({bool reset = true}) async {
    double newBudget = await showDialog<double>(
      context: context,
      builder: (context) =>  NewCycleDialog(),
    );
    if (newBudget != null) {
      await widget.storageService.saveStartingBudget(newBudget, reset: true);
      setState(() {
        this.startBudget = newBudget;
        if (reset) {
          this.expenses = [];
        }
      });
    }
  }

  
}
