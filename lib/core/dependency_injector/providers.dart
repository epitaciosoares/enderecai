import 'package:enderecai/core/dependency_injector/injector.dart';
import 'package:enderecai/presentation/viewmodels/home_viewmodel.dart';
import 'package:provider/provider.dart';

get providers => [
  ChangeNotifierProvider(
    create: (_) => dependencyInjector.get<HomeViewModel>(),
  ),
];
