import 'package:enderecai/core/dependency_injector/providers.dart';
import 'package:enderecai/core/themes/app_themes.dart';
import 'package:enderecai/presentation/pages/home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: providers,
      child: MaterialApp(
        title: 'Endereçaí',
        theme: AppThemes.lightTheme,
        darkTheme: AppThemes.darkTheme,
        themeMode: ThemeMode.system,
        home: const Home(title: 'Flutter Demo Home Page'),
      ),
    );
  }
}
