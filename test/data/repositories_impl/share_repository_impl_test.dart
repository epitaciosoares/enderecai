import 'package:flutter_test/flutter_test.dart';
import 'package:enderecai/data/repositories_impl/share_repository_impl.dart';
import 'package:enderecai/data/datasources/share_adapter.dart';
import 'package:enderecai/data/datasources/url_share_adapter.dart';

import 'package:mocktail/mocktail.dart';

class MockShareAdapter extends Mock implements ShareAdapter {}

class MockUrlShareAdapter extends Mock implements UrlShareAdapter {}

void main() {
  late MockShareAdapter mockShareAdapter;
  late MockUrlShareAdapter mockUrlShareAdapter;
  late ShareRepositoryImpl repository;

  setUp(() {
    mockShareAdapter = MockShareAdapter();
    mockUrlShareAdapter = MockUrlShareAdapter();
    repository = ShareRepositoryImpl(mockShareAdapter, mockUrlShareAdapter);
  });

  test('deve compartilhar texto com sucesso', () async {
    when(
      () => mockShareAdapter.shareText(any()),
    ).thenAnswer((_) async => Future.value());
    final result = await repository.shareText('texto de teste');
    expect(result.isSuccess(), true);
    verify(() => mockShareAdapter.shareText('texto de teste')).called(1);
  });

  test('deve compartilhar endereço no maps com sucesso', () async {
    when(
      () => mockUrlShareAdapter.shareToMaps(any()),
    ).thenAnswer((_) async => Future.value());
    final result = await repository.shareToMaps('endereço de teste');
    expect(result.isSuccess(), true);
    verify(
      () => mockUrlShareAdapter.shareToMaps('endereço de teste'),
    ).called(1);
  });
}
