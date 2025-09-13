import 'package:flutter/material.dart';

abstract interface class ThemeModeRepository {
  Future<ThemeMode> getThemeMode();
  Future<void> setThemeMode(ThemeMode mode);
}
