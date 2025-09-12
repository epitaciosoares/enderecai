// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cep_model.dart';

// **************************************************************************
// RealmObjectGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
class CepModel extends _CepModel
    with RealmEntity, RealmObjectBase, RealmObject {
  static var _defaultsSet = false;

  CepModel(
    String cep, {
    String? logradouro = "",
    String? complemento = "",
    String? unidade = "",
    String? bairro = "",
    String? localidade = "",
    String? uf = "",
    String? estado = "",
    String? regiao = "",
    String? ibge = "",
    String? gia = "",
    String? ddd = "",
    String? siafi = "",
  }) {
    if (!_defaultsSet) {
      _defaultsSet = RealmObjectBase.setDefaults<CepModel>({
        'logradouro': "",
        'complemento': "",
        'unidade': "",
        'bairro': "",
        'localidade': "",
        'uf': "",
        'estado': "",
        'regiao': "",
        'ibge': "",
        'gia': "",
        'ddd': "",
        'siafi': "",
      });
    }
    RealmObjectBase.set(this, 'cep', cep);
    RealmObjectBase.set(this, 'logradouro', logradouro);
    RealmObjectBase.set(this, 'complemento', complemento);
    RealmObjectBase.set(this, 'unidade', unidade);
    RealmObjectBase.set(this, 'bairro', bairro);
    RealmObjectBase.set(this, 'localidade', localidade);
    RealmObjectBase.set(this, 'uf', uf);
    RealmObjectBase.set(this, 'estado', estado);
    RealmObjectBase.set(this, 'regiao', regiao);
    RealmObjectBase.set(this, 'ibge', ibge);
    RealmObjectBase.set(this, 'gia', gia);
    RealmObjectBase.set(this, 'ddd', ddd);
    RealmObjectBase.set(this, 'siafi', siafi);
  }

  CepModel._();

  @override
  String get cep => RealmObjectBase.get<String>(this, 'cep') as String;
  @override
  set cep(String value) => RealmObjectBase.set(this, 'cep', value);

  @override
  String? get logradouro =>
      RealmObjectBase.get<String>(this, 'logradouro') as String?;
  @override
  set logradouro(String? value) =>
      RealmObjectBase.set(this, 'logradouro', value);

  @override
  String? get complemento =>
      RealmObjectBase.get<String>(this, 'complemento') as String?;
  @override
  set complemento(String? value) =>
      RealmObjectBase.set(this, 'complemento', value);

  @override
  String? get unidade =>
      RealmObjectBase.get<String>(this, 'unidade') as String?;
  @override
  set unidade(String? value) => RealmObjectBase.set(this, 'unidade', value);

  @override
  String? get bairro => RealmObjectBase.get<String>(this, 'bairro') as String?;
  @override
  set bairro(String? value) => RealmObjectBase.set(this, 'bairro', value);

  @override
  String? get localidade =>
      RealmObjectBase.get<String>(this, 'localidade') as String?;
  @override
  set localidade(String? value) =>
      RealmObjectBase.set(this, 'localidade', value);

  @override
  String? get uf => RealmObjectBase.get<String>(this, 'uf') as String?;
  @override
  set uf(String? value) => RealmObjectBase.set(this, 'uf', value);

  @override
  String? get estado => RealmObjectBase.get<String>(this, 'estado') as String?;
  @override
  set estado(String? value) => RealmObjectBase.set(this, 'estado', value);

  @override
  String? get regiao => RealmObjectBase.get<String>(this, 'regiao') as String?;
  @override
  set regiao(String? value) => RealmObjectBase.set(this, 'regiao', value);

  @override
  String? get ibge => RealmObjectBase.get<String>(this, 'ibge') as String?;
  @override
  set ibge(String? value) => RealmObjectBase.set(this, 'ibge', value);

  @override
  String? get gia => RealmObjectBase.get<String>(this, 'gia') as String?;
  @override
  set gia(String? value) => RealmObjectBase.set(this, 'gia', value);

  @override
  String? get ddd => RealmObjectBase.get<String>(this, 'ddd') as String?;
  @override
  set ddd(String? value) => RealmObjectBase.set(this, 'ddd', value);

  @override
  String? get siafi => RealmObjectBase.get<String>(this, 'siafi') as String?;
  @override
  set siafi(String? value) => RealmObjectBase.set(this, 'siafi', value);

  @override
  Stream<RealmObjectChanges<CepModel>> get changes =>
      RealmObjectBase.getChanges<CepModel>(this);

  @override
  Stream<RealmObjectChanges<CepModel>> changesFor([List<String>? keyPaths]) =>
      RealmObjectBase.getChangesFor<CepModel>(this, keyPaths);

  @override
  CepModel freeze() => RealmObjectBase.freezeObject<CepModel>(this);

  EJsonValue toEJson() {
    return <String, dynamic>{
      'cep': cep.toEJson(),
      'logradouro': logradouro.toEJson(),
      'complemento': complemento.toEJson(),
      'unidade': unidade.toEJson(),
      'bairro': bairro.toEJson(),
      'localidade': localidade.toEJson(),
      'uf': uf.toEJson(),
      'estado': estado.toEJson(),
      'regiao': regiao.toEJson(),
      'ibge': ibge.toEJson(),
      'gia': gia.toEJson(),
      'ddd': ddd.toEJson(),
      'siafi': siafi.toEJson(),
    };
  }

  static EJsonValue _toEJson(CepModel value) => value.toEJson();
  static CepModel _fromEJson(EJsonValue ejson) {
    if (ejson is! Map<String, dynamic>) return raiseInvalidEJson(ejson);
    return switch (ejson) {
      {'cep': EJsonValue cep} => CepModel(
        fromEJson(cep),
        logradouro: fromEJson(ejson['logradouro'], defaultValue: ""),
        complemento: fromEJson(ejson['complemento'], defaultValue: ""),
        unidade: fromEJson(ejson['unidade'], defaultValue: ""),
        bairro: fromEJson(ejson['bairro'], defaultValue: ""),
        localidade: fromEJson(ejson['localidade'], defaultValue: ""),
        uf: fromEJson(ejson['uf'], defaultValue: ""),
        estado: fromEJson(ejson['estado'], defaultValue: ""),
        regiao: fromEJson(ejson['regiao'], defaultValue: ""),
        ibge: fromEJson(ejson['ibge'], defaultValue: ""),
        gia: fromEJson(ejson['gia'], defaultValue: ""),
        ddd: fromEJson(ejson['ddd'], defaultValue: ""),
        siafi: fromEJson(ejson['siafi'], defaultValue: ""),
      ),
      _ => raiseInvalidEJson(ejson),
    };
  }

  static final schema = () {
    RealmObjectBase.registerFactory(CepModel._);
    register(_toEJson, _fromEJson);
    return const SchemaObject(ObjectType.realmObject, CepModel, 'CepModel', [
      SchemaProperty('cep', RealmPropertyType.string, primaryKey: true),
      SchemaProperty('logradouro', RealmPropertyType.string, optional: true),
      SchemaProperty('complemento', RealmPropertyType.string, optional: true),
      SchemaProperty('unidade', RealmPropertyType.string, optional: true),
      SchemaProperty('bairro', RealmPropertyType.string, optional: true),
      SchemaProperty('localidade', RealmPropertyType.string, optional: true),
      SchemaProperty('uf', RealmPropertyType.string, optional: true),
      SchemaProperty('estado', RealmPropertyType.string, optional: true),
      SchemaProperty('regiao', RealmPropertyType.string, optional: true),
      SchemaProperty('ibge', RealmPropertyType.string, optional: true),
      SchemaProperty('gia', RealmPropertyType.string, optional: true),
      SchemaProperty('ddd', RealmPropertyType.string, optional: true),
      SchemaProperty('siafi', RealmPropertyType.string, optional: true),
    ]);
  }();

  @override
  SchemaObject get objectSchema => RealmObjectBase.getSchema(this) ?? schema;
}
