import 'package:flutter/material.dart';
import 'package:flutter_ui_designs/cal/generated/i18n.dart';

typedef String NameGetter(BuildContext context);

class Currency {
  final String symbol;
  final bool onLeft;
  final NameGetter getName;
  final String name;

  Currency._(this.symbol, this.name, this.onLeft, this.getName);

  
  static Currency usd =  Currency._(
      "", "USD", true, (context) => S.of(context).currencyUSD);
  

  static List<Currency> currencies = [
    Currency.usd,
    
  ];

  @override
  String toString() => name;

  static Currency fromString(String name) {
    switch (name) {
      
      case "USD":
        return usd;
      
      default:
        return usd;
    }
  }
}

String valueWithCurrency(double value, Currency currency) {
  String sign = value < 0 ? "-" : "";
  String prefix = currency.onLeft ? currency.symbol : "";
  String stringValue = value.abs().toStringAsFixed(0);
  String suffix = currency.onLeft ? "" : " ${currency.symbol}";
  return sign + prefix + stringValue + suffix;
}
