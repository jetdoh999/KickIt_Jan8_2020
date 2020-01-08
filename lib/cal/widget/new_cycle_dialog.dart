import 'package:flutter/material.dart';
import 'package:flutter_ui_designs/cal/generated/i18n.dart';
import 'package:flutter_ui_designs/cal/widget/cut_corners_border.dart';

class NewCycleDialog extends StatefulWidget {
  @override
  _NewCycleDialogState createState() =>  _NewCycleDialogState();
}

class _NewCycleDialogState extends State<NewCycleDialog> {
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
      title:  Text(S.of(context).settozero),
      content:  TextField(
        cursorColor: Colors.blue,
        controller: _controller,
        keyboardType: TextInputType.number,
        decoration:  InputDecoration(
          labelText: S.of(context).budget,
          border:
              CutCornersBorder(borderSide: BorderSide(color: Colors.yellow)),
        ),
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
