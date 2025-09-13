import 'package:enderecai/domain/repositories/theme_mode_repository.dart';
import 'package:flutter/material.dart';

class ThemeModeViewmodel with ChangeNotifier {
  final ThemeModeRepository _themeModeRepository;
  late ThemeMode currentMode = ThemeMode.system;

  ThemeModeViewmodel(this._themeModeRepository);

  void setThemeMode() {
    if (currentMode == ThemeMode.light) {
      currentMode = ThemeMode.dark;
    } else {
      currentMode = ThemeMode.light;
    }
    _themeModeRepository.setThemeMode(currentMode);
    notifyListeners();
  }

  Future<void> loadThemeMode() async {
    currentMode = await _themeModeRepository.getThemeMode();
    notifyListeners();
  }
}
