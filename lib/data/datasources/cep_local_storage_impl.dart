import 'package:enderecai/core/database/database_adapter.dart';
import 'package:enderecai/data/datasources/cep_local_storage.dart';
import 'package:enderecai/data/models/cep_model.dart';

class CepLocalStorageImpl extends CepLocalStorage {
  final DatabaseAdapter _database;

  CepLocalStorageImpl(this._database);

  @override
  Future<CepModel?> getAddressFromCep(String cep) async {
    final cepModel = await _database.find<CepModel>(cep);

    if (cepModel != null) {
      return cepModel;
    } else {
      return null;
    }
  }

  @override
  Future<Object> saveCep(CepModel cepModel) async {
    try {
      await _database.insert<CepModel>(cepModel);
      return cepModel;
    } catch (e) {
      throw Exception("Erro ao salvar o CEP: $e");
    }
  }
}
