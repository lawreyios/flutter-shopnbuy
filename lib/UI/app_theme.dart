import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData get data {
    return ThemeData(
      textTheme: TextTheme(
        headline: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
        title: TextStyle(
          fontWeight: FontWeight.w700,
          fontSize: 20.0,
        ),
        subtitle: TextStyle(
          fontWeight: FontWeight.w300,
          fontSize: 18.0,
        ),
      ),
    );
  }
}
