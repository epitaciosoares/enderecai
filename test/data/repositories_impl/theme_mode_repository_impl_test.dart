import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:enderecai/data/repositories_impl/theme_mode_repository_impl.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('ThemeModeRepositoryImpl', () {
    late ThemeModeRepositoryImpl repository;

    setUp(() {
      repository = ThemeModeRepositoryImpl();
    });

    test('deve retornar ThemeMode.light quando salvo como light', () async {
      SharedPreferences.setMockInitialValues({'theme_mode': 'light'});
      final mode = await repository.getThemeMode();
      expect(mode, ThemeMode.light);
    });

    test('deve retornar ThemeMode.dark quando salvo como dark', () async {
      SharedPreferences.setMockInitialValues({'theme_mode': 'dark'});
      final mode = await repository.getThemeMode();
      expect(mode, ThemeMode.dark);
    });

    test('deve retornar ThemeMode.system quando salvo como system', () async {
      SharedPreferences.setMockInitialValues({'theme_mode': 'system'});
      final mode = await repository.getThemeMode();
      expect(mode, ThemeMode.system);
    });

    test('deve retornar ThemeMode.system quando não há valor salvo', () async {
      SharedPreferences.setMockInitialValues({});
      final mode = await repository.getThemeMode();
      expect(mode, ThemeMode.system);
    });

    test('deve salvar ThemeMode.light corretamente', () async {
      SharedPreferences.setMockInitialValues({});
      await repository.setThemeMode(ThemeMode.light);
      final prefs = await SharedPreferences.getInstance();
      expect(prefs.getString('theme_mode'), 'light');
    });

    test('deve salvar ThemeMode.dark corretamente', () async {
      SharedPreferences.setMockInitialValues({});
      await repository.setThemeMode(ThemeMode.dark);
      final prefs = await SharedPreferences.getInstance();
      expect(prefs.getString('theme_mode'), 'dark');
    });

    test('deve salvar ThemeMode.system corretamente', () async {
      SharedPreferences.setMockInitialValues({});
      await repository.setThemeMode(ThemeMode.system);
      final prefs = await SharedPreferences.getInstance();
      expect(prefs.getString('theme_mode'), 'system');
    });
  });
}
