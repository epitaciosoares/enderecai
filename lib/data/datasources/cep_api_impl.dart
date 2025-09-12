import 'package:enderecai/core/network/http_adapter.dart';
import 'package:enderecai/data/datasources/cep_api.dart';

class CepApiImpl extends CepApi {
  final HttpAdapter _httpAdapter;

  CepApiImpl(this._httpAdapter);

  @override
  Future<Map<String, dynamic>> getAddressFromCep(String cep) async {
    try {
      var response = await _httpAdapter.get(
        "https://viacep.com.br/ws/$cep/json/",
      );

      if (response.statusCode == 200) {
        // Sucesso
        return response.data;
      } else {
        // Erro
        throw Exception("Erro ao buscar o CEP: ${response.statusCode}");
      }
    } catch (e) {
      throw Exception("Erro ao buscar o CEP: $e");
    }
  }
}
