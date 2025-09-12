import 'package:enderecai/data/datasources/cep_api.dart';
import 'package:enderecai/data/datasources/cep_local_storage.dart';
import 'package:enderecai/data/models/cep_model.dart';
import 'package:enderecai/domain/repositories/cep_repository.dart';
import 'package:result_dart/result_dart.dart';

class CepRepositoryImpl extends CepRepository {
  final CepApi _cepApi;
  final CepLocalStorage _cepLocalStorage;

  CepRepositoryImpl(this._cepApi, this._cepLocalStorage);

  @override
  AsyncResult<CepModel> getAddressFromCep(String cep) async {
    try {
      // Consulta Banco Local.
      final localResult = await _cepLocalStorage.getAddressFromCep(cep);
      if (localResult != null) {
        // Verifica se existe o CEP no banco local.
        // Se existir, retorna o endereço.
        return Success(localResult);
      }

      // Se não existir, consulta a API.
      final apiResult = await _cepApi.getAddressFromCep(cep);
      if (apiResult.isNotEmpty) {
        // Se a API retornar o endereço, salva no banco local e retorna o endereço.
        final cepModel = CepModel(
          apiResult['cep'],
          logradouro: apiResult['logradouro'] ?? "",
          complemento: apiResult['complemento'] ?? "",
          bairro: apiResult['bairro'] ?? "",
          localidade: apiResult['localidade'] ?? "",
          uf: apiResult['uf'] ?? "",
          ibge: apiResult['ibge'] ?? "",
          gia: apiResult['gia'] ?? "",
          ddd: apiResult['ddd'] ?? "",
          siafi: apiResult['siafi'] ?? "",
          unidade: apiResult['unidade'] ?? "",
          estado: apiResult['estado'] ?? "",
          regiao: apiResult['regiao'] ?? "",
        );
        await _cepLocalStorage.saveCep(cepModel);
        return Success(cepModel);
      }

      // Se a API não retornar o endereço, retorna um erro.
      return Failure(Exception('CEP não encontrado'));
    } catch (e) {
      return Failure(Exception('Erro ao buscar o CEP: $e'));
    }
  }
}
