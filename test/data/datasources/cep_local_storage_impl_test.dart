import 'package:enderecai/core/database/realm_config.dart';
import 'package:enderecai/core/database/realm_database_adapter_impl.dart';
import 'package:enderecai/data/datasources/cep_local_storage_impl.dart';
import 'package:enderecai/data/models/cep_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:enderecai/core/database/database_adapter.dart';
import 'package:mocktail/mocktail.dart';

class MockDatabaseAdapter extends Mock implements DatabaseAdapter {}

void main() {
  late MockDatabaseAdapter mockDatabase;
  late CepLocalStorageImpl storage;

  setUp(() {
    mockDatabase = MockDatabaseAdapter();
    storage = CepLocalStorageImpl(mockDatabase);
  });

  test('deve retornar CepModel quando encontrado no banco', () async {
    final cep = '01001000';
    final model = CepModel(cep);
    when(() => mockDatabase.find<CepModel>(cep)).thenAnswer((_) async => model);
    final result = await storage.getAddressFromCep(cep);
    expect(result, isA<CepModel>());
    expect(result?.cep, cep);
  });

  test('deve retornar null quando não encontrado no banco', () async {
    final cep = '99999999';
    when(() => mockDatabase.find<CepModel>(cep)).thenAnswer((_) async => null);
    final result = await storage.getAddressFromCep(cep);
    expect(result, isNull);
  });

  test('deve salvar CepModel no banco', () async {
    final model = CepModel('01001000');
    when(
      () => mockDatabase.insert<CepModel>(model),
    ).thenAnswer((_) async => Future.value());
    final result = await storage.saveCep(model);
    expect(result, isA<CepModel>());
    expect((result as CepModel).cep, model.cep);
    verify(() => mockDatabase.insert<CepModel>(model)).called(1);
  });

  test('deve lançar exceção ao buscar com erro', () async {
    final cep = 'erro';
    when(
      () => mockDatabase.find<CepModel>(cep),
    ).thenThrow(Exception('DB error'));
    expect(() async => await storage.getAddressFromCep(cep), throwsException);
  });

  test('deve lançar exceção ao salvar com erro', () async {
    final model = CepModel('erro');
    when(
      () => mockDatabase.insert<CepModel>(model),
    ).thenThrow(Exception('DB error'));
    expect(() async => await storage.saveCep(model), throwsException);
  });

  test('cep local storage impl ...', () async {
    final dataBase = CepLocalStorageImpl(
      RealmDatabaseAdapterImpl(RealmConfig.initRealm()),
    );

    await dataBase.saveCep(
      CepModel(
        '60530-720',
        logradouro: 'Rua Professor João de Andrade',
        complemento: 'de 501/502 ao fim',
        bairro: 'Jangurussu',
        localidade: 'Fortaleza',
        uf: 'CE',
        ibge: '2304400',
        gia: '',
        ddd: '85',
        siafi: '4123',
      ),
    );

    await dataBase.getAddressFromCep('60530-720');

    // print(result);
  });
}
