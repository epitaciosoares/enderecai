import 'package:enderecai/domain/repositories/theme_mode_repository.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeModeRepositoryImpl implements ThemeModeRepository {
  @override
  Future<ThemeMode> getThemeMode() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    final themeString = sharedPreferences.getString('theme_mode') ?? 'system';
    return switch (themeString) {
      'light' => ThemeMode.light,
      'dark' => ThemeMode.dark,
      _ => ThemeMode.system,
    };
  }

  @override
  Future<void> setThemeMode(ThemeMode mode) async {
    try {
      return SharedPreferences.getInstance().then((prefs) {
        String modeString = switch (mode) {
          ThemeMode.light => 'light',
          ThemeMode.dark => 'dark',
          ThemeMode.system => 'system',
        };
        prefs.setString('theme_mode', modeString);
      });
    } catch (e) {
      return Future.error('Erro ao salvar o modo de tema: $e');
    }
  }
}
