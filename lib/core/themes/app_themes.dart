import 'package:flutter/material.dart';

class AppThemes {
  // === Light Theme ===
  static final ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: const Color(0xFFFF6F00), // Laranja principal
    scaffoldBackgroundColor: const Color(0xFFFFFFFF), // Fundo branco
    cardColor: const Color(0xFFF5F5F5), // Fundo secundário (cards)
    colorScheme: const ColorScheme.light(
      primary: Color(0xFFFF6F00), // Laranja
      secondary: Color(0xFF29B6F6),
      surface: Color(0xFFF5F5F5),
      onPrimary: Colors.white,
      onSecondary: Colors.white, // Texto primário
      onSurface: Color(0xFF757575), // Texto secundário
      error: Color(0xFFE53935),
      onError: Colors.white,
    ),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(color: Color(0xFF212121)), // Texto primário
      bodyMedium: TextStyle(color: Color(0xFF757575)), // Texto secundário
    ),
  );

  // === Dark Theme ===
  static final ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: const Color(0xFFFF6F00), // Laranja principal
    scaffoldBackgroundColor: const Color(0xFF121212), // Fundo escuro
    cardColor: const Color(0xFF1E1E1E), // Fundo secundário (cards)
    colorScheme: const ColorScheme.dark(
      primary: Color(0xFFFF6F00), // Laranja
      secondary: Color(0xFF29B6F6),
      surface: Color(0xFF1E1E1E),
      onPrimary: Colors.white,
      onSecondary: Colors.white, // Texto primário
      onSurface: Color(0xFFB0BEC5), // Texto secundário
      error: Color(0xFFE53935),
      onError: Colors.white,
    ),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(color: Color(0xFFFFFFFF)), // Texto primário
      bodyMedium: TextStyle(color: Color(0xFFB0BEC5)), // Texto secundário
    ),
  );
}
