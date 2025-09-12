import 'package:realm/realm.dart';

part 'cep_model.realm.dart';

@RealmModel()
// ignore: unused_element
class _CepModel {
  @PrimaryKey()
  late String cep;
  late String? logradouro = "";
  late String? complemento = "";
  late String? unidade = "";
  late String? bairro = "";
  late String? localidade = "";
  late String? uf = "";
  late String? estado = "";
  late String? regiao = "";
  late String? ibge = "";
  late String? gia = "";
  late String? ddd = "";
  late String? siafi = "";
}
