import 'package:flutter/material.dart';
import 'package:flutter_ui_designs/cal/generated/i18n.dart';
import 'package:flutter_ui_designs/cal/widget/cut_corners_border.dart';

class ChangeBudgetDialog extends StatefulWidget {
  final double previousBudget;

  const ChangeBudgetDialog({Key key, this.previousBudget}) : super(key: key);

  @override
  _ChangeBudgetDialogState createState() =>  _ChangeBudgetDialogState();
}

class _ChangeBudgetDialogState extends State<ChangeBudgetDialog> {
  TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller =  TextEditingController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return  AlertDialog(
      title:  Text(S.of(context).changeBudget),
      content:  TextField(
        cursorColor: Colors.yellow,
        controller: _controller,
        keyboardType: TextInputType.number,
        decoration:  InputDecoration(
            border:
                CutCornersBorder(borderSide: BorderSide(color: Colors.yellow)),
            labelText: S.of(context).budget,
            hintText: widget.previousBudget?.toStringAsFixed(2) ?? ''),
      ),
      actions: <Widget>[
         FlatButton(
          onPressed: () => Navigator.of(context).pop(),
          child:  Text(S.of(context).cancel.toUpperCase()),
        ),
         FlatButton(
          onPressed: () =>
              Navigator.of(context).pop(double.parse(_controller.value.text)),
          child:  Text(S.of(context).confirm.toUpperCase()),
        ),
      ],
    );
  }
}
