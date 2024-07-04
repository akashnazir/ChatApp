// ignore_for_file: prefer_final_fields, unused_field

import 'package:demo_app/theme/dark_mode.dart';
import 'package:demo_app/theme/light_mode.dart';
import 'package:flutter/material.dart';

class ThemeProvider with ChangeNotifier {
  ThemeData _theme = lightMode;

  ThemeData get theme => _theme;

  bool get isDarkMode => _theme == darkMode;

  void toggleTheme() {
    if (_theme == lightMode) {
      _theme = darkMode;
    } else {
      _theme = lightMode;
    }
    notifyListeners();
  }
}
