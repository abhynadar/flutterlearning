import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:udemy_flutter/provider/dark_theme_provider.dart';

class Utils {
  BuildContext context;
  Utils(this.context);

  bool get getTheme => Provider.of<DarkThemeProvider>(context).getDarkTheme;

  Color get getColor => getTheme ? Colors.white : Colors.black;

  Size get getScreenSize => MediaQuery.of(context).size;
}
