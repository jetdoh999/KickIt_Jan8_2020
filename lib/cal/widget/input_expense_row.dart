import 'package:flutter/material.dart';
import 'package:flutter_ui_designs/cal/generated/i18n.dart';
import 'package:flutter_ui_designs/cal/model/expense.dart';
import 'package:flutter_ui_designs/cal/widget/cut_corners_border.dart';

class InputExpenseRow extends StatefulWidget {
  final Function(Expense) onClick;

  const InputExpenseRow({Key key, this.onClick}) : super(key: key);

  @override
  _InputExpenseRowState createState() =>  _InputExpenseRowState();
}

class _InputExpenseRowState extends State<InputExpenseRow> {
  TextEditingController _inputController;

  @override
  void initState() {
    super.initState();
    _inputController =  TextEditingController();
  }

  @override
  void dispose() {
    _inputController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child:  Row(
        children: <Widget>[
           Expanded(
            child:  Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4.0),
              child:  TextField(
                cursorColor: Colors.yellow,
                controller: _inputController,
                keyboardType: TextInputType.number,
                decoration:  InputDecoration(
                  labelText: S.of(context).match,
                  border: CutCornersBorder(
                    borderSide: BorderSide(color: Colors.yellow),
                  ),
                ),
              ),
            ),
          ),
           Expanded(
            child:  Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4.0),
              child:  SizedBox(
                height: 56.0,
                child:  RaisedButton(
                  padding:  EdgeInsets.all(0.0),
                  child:  Text(
                    S.of(context).add.toUpperCase(),
                    style: Theme.of(context)
                        .textTheme
                        .subhead
                        .copyWith(color: Colors.black),
                  ),
                  onPressed: () {
                    try {
                      double value = double.parse(_inputController.value.text);
                      DateTime dateTime =  DateTime.now();
                      widget.onClick( Expense(value, dateTime));
                      _inputController.clear();
                      FocusScope.of(context).requestFocus( FocusNode());
                    } catch (FormatException) {}
                  },
                  shape:  BeveledRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8.0)),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
