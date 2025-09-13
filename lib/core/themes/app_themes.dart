import 'package:flutter/material.dart';

class AppThemes {
  // === Paleta fixa ===
  static const Color orange = Color(0xFFFF6F00); // Cor principal
  static const Color blue = Color(0xFF29B6F6); // Secundária
  static const Color green = Color(0xFF00C853); // Sucesso
  static const Color red = Color(0xFFE53935); // Erro

  // Light
  static const Color lightBackground = Color(0xFFFFFFFF);
  static const Color lightSurface = Color(0xFFF5F5F5);
  static const Color lightTextPrimary = Color(0xFF212121);
  static const Color lightTextSecondary = Color(0xFF757575);

  // Dark
  static const Color darkBackground = Color(0xFF121212);
  static const Color darkSurface = Color(0xFF1E1E1E);
  static const Color darkTextPrimary = Color(0xFFFFFFFF);
  static const Color darkTextSecondary = Color(0xFFB0BEC5);

  // === Light Theme ===
  static final ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    primaryColor: orange,
    scaffoldBackgroundColor: lightBackground,
    cardColor: lightSurface,
    colorScheme: const ColorScheme.light(
      primary: orange,
      secondary: blue,
      surface: lightBackground,
      onPrimary: Colors.white,
      onSecondary: Colors.white,
      onSurface: lightTextPrimary,
      error: red,
      onError: Colors.white,
    ),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(color: lightTextPrimary),
      bodyMedium: TextStyle(color: lightTextSecondary),
    ),
  );

  // === Dark Theme ===
  static final ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    primaryColor: orange,
    scaffoldBackgroundColor: darkBackground,
    cardColor: darkSurface,
    colorScheme: const ColorScheme.dark(
      primary: orange,
      secondary: blue,
      surface: darkBackground,
      onPrimary: Colors.white,
      onSecondary: Colors.white,
      onSurface: darkTextPrimary,
      error: red,
      onError: Colors.white,
    ),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(color: darkTextPrimary),
      bodyMedium: TextStyle(color: darkTextSecondary),
    ),
  );
}
