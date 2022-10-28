import 'package:flutter/material.dart';

class Styles {
  static ThemeData themeData(bool isDarkTheme, BuildContext context) {
    return ThemeData(
        scaffoldBackgroundColor:
            isDarkTheme ? Colors.blueGrey[700] : Colors.purple[100],
        primaryColor: isDarkTheme ? Colors.blueGrey[900] : Colors.purple[900],
        colorScheme: ThemeData().colorScheme.copyWith(
            secondary: isDarkTheme ? Colors.blueGrey[100] : Colors.purple[100],
            brightness: isDarkTheme ? Brightness.dark : Brightness.light),
        cardColor: isDarkTheme ? Colors.blueGrey[600] : Colors.purple[600],
        appBarTheme: AppBarTheme(
            backgroundColor:
                isDarkTheme ? Colors.blueGrey[500] : Colors.purple[500]),
        canvasColor: isDarkTheme ? Colors.blueGrey[200] : Colors.purple[100],
        buttonTheme: Theme.of(context).buttonTheme.copyWith(
            colorScheme: isDarkTheme
                ? const ColorScheme.dark()
                : const ColorScheme.light()));
  }
}

//dark 900
//mid 400
//light 100

        // scaffoldBackgroundColor: Colors.
