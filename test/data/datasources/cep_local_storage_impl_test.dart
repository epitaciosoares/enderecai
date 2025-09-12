import 'package:enderecai/core/database/realm_config.dart';
import 'package:enderecai/core/database/realm_database_adapter_impl.dart';
import 'package:enderecai/data/datasources/cep_local_storage_impl.dart';
import 'package:enderecai/data/models/cep_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
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
