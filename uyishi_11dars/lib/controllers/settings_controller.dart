import 'package:flutter/material.dart';
import 'package:uyishi_11dars/models/settings.dart';

class SettingsController with ChangeNotifier {
  final Settings settings = Settings(themeMode: ThemeMode.system);

  void toggleThemeMode(bool isDone) {
    if (isDone) {
      settings.themeMode = ThemeMode.dark;
    } else {
      settings.themeMode = ThemeMode.light;
    }
    notifyListeners();
  }
}
