import 'package:enderecai/core/database/database_adapter.dart';
import 'package:enderecai/core/database/realm_config.dart';
import 'package:enderecai/core/database/realm_database_adapter_impl.dart';
import 'package:enderecai/core/network/dio_http_adapter_impl.dart';
import 'package:enderecai/core/network/http_adapter.dart';
import 'package:enderecai/data/datasources/cep_api.dart';
import 'package:enderecai/data/datasources/cep_api_impl.dart';
import 'package:enderecai/data/datasources/cep_local_storage.dart';
import 'package:enderecai/data/datasources/cep_local_storage_impl.dart';
import 'package:enderecai/data/repositories_impl/cep_repository_impl.dart';
import 'package:enderecai/data/repositories_impl/theme_mode_repository_impl.dart';
import 'package:enderecai/domain/repositories/cep_repository.dart';
import 'package:enderecai/domain/repositories/theme_mode_repository.dart';
import 'package:enderecai/presentation/viewmodels/home_viewmodel.dart';
import 'package:enderecai/presentation/viewmodels/theme_mode_viewmodel.dart';
import 'package:get_it/get_it.dart';
import 'package:realm/realm.dart';

final dependencyInjector = GetIt.instance;

Future<void> setupInjection() async {
  // As dependências serão registradas aqui.
  dependencyInjector.registerLazySingleton<HttpAdapter>(
    () => DioHttpAdapterImpl(),
  );
  dependencyInjector.registerLazySingleton<Realm>(
    () => RealmConfig.initRealm(),
  );

  dependencyInjector.registerLazySingleton<DatabaseAdapter>(
    () => RealmDatabaseAdapterImpl(dependencyInjector<Realm>()),
  );

  dependencyInjector.registerLazySingleton<CepApi>(
    () => CepApiImpl(dependencyInjector<HttpAdapter>()),
  );

  dependencyInjector.registerLazySingleton<CepLocalStorage>(
    () => CepLocalStorageImpl(dependencyInjector<DatabaseAdapter>()),
  );

  dependencyInjector.registerLazySingleton<CepRepository>(
    () => CepRepositoryImpl(
      dependencyInjector<CepApi>(),
      dependencyInjector<CepLocalStorage>(),
    ),
  );

  dependencyInjector.registerLazySingleton<ThemeModeRepository>(
    () => ThemeModeRepositoryImpl(),
  );

  dependencyInjector.registerFactory<HomeViewModel>(
    () => HomeViewModel(dependencyInjector<CepRepository>()),
  );

  dependencyInjector.registerFactory<ThemeModeViewmodel>(
    () => ThemeModeViewmodel(dependencyInjector.get<ThemeModeRepository>()),
  );
}
