import 'package:flutter/material.dart';

final myTheme = ThemeData.light().copyWith(
    brightness: Brightness.light,
    accentColor: Color(0xFFFFC107),
    primaryColor: Colors.indigo,
    accentColorBrightness: Brightness.light,
    backgroundColor: Color.fromRGBO(231, 231, 231  , 1.0),
    buttonColor: Colors.red,
    primaryColorDark: Color(0xFF212121),
    primaryColorLight: Color.fromRGBO(85, 192, 243, 1.0),
    iconTheme: ThemeData.dark().iconTheme.copyWith(
      color: Colors.black,
    ),
    textTheme: ThemeData.dark().textTheme.apply(
    bodyColor: Colors.black,
    displayColor: Color(0xFFF3F7FB),
  )
    
);
