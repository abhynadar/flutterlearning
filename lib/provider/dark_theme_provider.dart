import 'package:udemy_flutter/services/dark_theme_prefs.dart';
import 'package:flutter/material.dart'; //In course it is cupertino.dart

class DarkThemeProvider with ChangeNotifier {
  DarkThemePrefs darkThemePrefs = DarkThemePrefs();
  bool _darkTheme = true;

  bool get getDarkTheme => _darkTheme;

  set setDarkTheme(bool value) {
    _darkTheme = value;
    darkThemePrefs.setDarkTheme(value);
    // debugPrint('setDarkTheme : $value');
    notifyListeners();
  }
}
