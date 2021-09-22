import 'package:flutter/material.dart';

class ThemeManager extends ChangeNotifier {
  ThemeManager([ThemeData initialTheme]) : _themeData = initialTheme ?? lightTheme;

  ThemeData _themeData;

  /// Returns the current theme
  ThemeData get themeData => _themeData;

  /// Sets the current theme
  set themeData(ThemeData value) {
    _themeData = value;
    notifyListeners();
  }

  /// Dark mode theme
  static ThemeData lightTheme = ThemeData();

  /// Light mode theme
  static ThemeData darkTheme = ThemeData();
}