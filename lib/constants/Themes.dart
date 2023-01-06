// ignore_for_file: file_names

import 'package:flutter/material.dart';

ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  scaffoldBackgroundColor: Colors.white,
  appBarTheme: const AppBarTheme(
    elevation: 0,
    backgroundColor: Colors.white,
    iconTheme: IconThemeData(color: Colors.black),
    titleTextStyle: TextStyle(color: Colors.black),
  ),
);

ThemeData darhTheme = ThemeData(
  brightness: Brightness.dark,
  scaffoldBackgroundColor: const Color(0xff15161a),
  appBarTheme: const AppBarTheme(
    elevation: 0,
    backgroundColor: Color(0xff15161a),
  ),
);
