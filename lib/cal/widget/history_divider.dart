import 'package:flutter/material.dart';
import 'package:flutter_ui_designs/cal/generated/i18n.dart';

class HistoryDivider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
         Expanded(
            child:  Divider(
          color: Colors.white,
        )),
         Padding(
          padding: const EdgeInsets.all(8.0),
          child:  Text(S.of(context).history),
          
        ),
         Expanded(
            child:  Divider(
          color: Colors.white,
        )),
      ],
    );
  }
}
