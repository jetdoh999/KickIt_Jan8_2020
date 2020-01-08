import 'package:flutter/material.dart';
import 'package:flutter_ui_designs/cal/generated/i18n.dart';
import 'package:flutter_ui_designs/cal/model/currency.dart';

class CardToSpend extends StatelessWidget {
  final double leftToSpend;
  final Currency currency;

  const CardToSpend({Key key, this.leftToSpend, this.currency})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Card(
      shape:  BeveledRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(16.0)),
      ),
      child:  Center(
        child:  Column(
          children: <Widget>[
             Padding(
              padding: const EdgeInsets.all(16.0),
              child: FittedBox(
                child:  Text(
                  valueWithCurrency(leftToSpend,currency),
                  style: Theme.of(context).textTheme.display3,
                ),
              ),
            ),
             Padding(
              padding: const EdgeInsets.all(8.0),
              child:  Text(S
                  .of(context)
                  .leftToSpend),
            ),
          ],
        ),
      ),
    );
  }
}
