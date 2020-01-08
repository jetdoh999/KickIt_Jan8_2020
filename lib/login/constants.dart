import 'package:flutter/material.dart';

final kHintTextStyle = TextStyle(
  color: Colors.white70,
  fontFamily: 'OpenSans',
);

final kLabelStyle = TextStyle(
  color: Colors.white,
  fontWeight: FontWeight.bold,
  fontFamily: 'OpenSans',
);

final kBoxDecorationStyle = BoxDecoration(
  color: Colors.black26.withOpacity(0.6),
  borderRadius: BorderRadius.circular(10.0),
  boxShadow: [
    BoxShadow(
      color: Colors.black26,
      blurRadius: 5.0,
      offset: Offset(0, 2),
    ),
  ],
);