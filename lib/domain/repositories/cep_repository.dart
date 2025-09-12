import 'package:enderecai/data/models/cep_model.dart';
import 'package:result_dart/result_dart.dart';

abstract class CepRepository {
  AsyncResult<CepModel> getAddressFromCep(String cep);
}
