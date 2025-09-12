import 'package:enderecai/app.dart';
import 'package:enderecai/core/dependency_injector/injector.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await setupInjection();

  runApp(const MyApp());
}
