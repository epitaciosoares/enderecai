import 'package:flutter_test/flutter_test.dart';
import 'package:enderecai/data/repositories_impl/cep_repository_impl.dart';
import 'package:enderecai/data/datasources/cep_api.dart';
import 'package:enderecai/data/datasources/cep_local_storage.dart';
import 'package:enderecai/data/models/cep_model.dart';
import 'package:mocktail/mocktail.dart';

class MockCepApi extends Mock implements CepApi {}

class MockCepLocalStorage extends Mock implements CepLocalStorage {}

void main() {
  late MockCepApi mockApi;
  late MockCepLocalStorage mockStorage;
  late CepRepositoryImpl repository;

  setUp(() {
    mockApi = MockCepApi();
    mockStorage = MockCepLocalStorage();
    repository = CepRepositoryImpl(mockApi, mockStorage);
  });

  test('deve retornar endereço do banco local se existir', () async {
    const cep = '12345678';
    final model = CepModel(cep);
    when(
      () => mockStorage.getAddressFromCep(cep),
    ).thenAnswer((_) async => model);

    when(
      () => mockApi.getAddressFromCep(cep),
    ).thenAnswer((_) async => <String, dynamic>{});

    final result = await repository.getAddressFromCep(cep);
    expect(result.isSuccess(), true);
    expect(result.getOrNull(), isA<CepModel>());
  });

  test('deve consultar API se não existir no banco local', () async {
    const cep = '87654321';
    when(
      () => mockStorage.getAddressFromCep(cep),
      // ignore: null_argument_to_non_null_type
    ).thenAnswer((_) => Future.value());
    when(
      () => mockApi.getAddressFromCep(cep),
    ).thenAnswer((_) async => <String, dynamic>{});

    final result = await repository.getAddressFromCep(cep);
    expect(result.isSuccess(), true);
    expect(result.getOrNull(), isA<CepModel>());
  });

  test('deve retornar erro se API não encontrar o endereço', () async {
    const cep = '00000000';
    when(
      () => mockStorage.getAddressFromCep(cep),
      // ignore: null_argument_to_non_null_type
    ).thenAnswer((_) => Future.value(null));
    when(
      () => mockApi.getAddressFromCep(cep),
    ).thenAnswer((_) async => <String, dynamic>{});

    final result = await repository.getAddressFromCep(cep);
    expect(result.isError(), true);
  });
}
