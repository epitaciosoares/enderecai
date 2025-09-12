import 'package:enderecai/data/models/cep_model.dart';

abstract class CepLocalStorage {
  Future<void> saveCep(CepModel cepModel);
  Future<CepModel?> getAddressFromCep(String cep);
}
