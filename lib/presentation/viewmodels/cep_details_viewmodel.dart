import 'package:enderecai/domain/repositories/share_repository.dart';
import 'package:flutter/material.dart';
import 'package:enderecai/data/models/cep_model.dart';

class CepDetailsViewModel extends ChangeNotifier {
  final CepModel cepModel;
  final ShareRepository _repository;

  CepDetailsViewModel(this.cepModel, this._repository);

  String get formattedAddress {
    final parts = <String>[];

    if (cepModel.logradouro?.isNotEmpty == true) {
      parts.add(cepModel.logradouro!);
    }

    if (cepModel.bairro?.isNotEmpty == true) {
      parts.add(cepModel.bairro!);
    }

    if (cepModel.localidade?.isNotEmpty == true) {
      final cityState = [cepModel.localidade!];
      if (cepModel.uf?.isNotEmpty == true) {
        cityState.add(cepModel.uf!);
      }
      parts.add(cityState.join(' - '));
    }

    return parts.join(', ');
  }

  String get formattedCep {
    final cep = cepModel.cep.replaceAll(RegExp(r'[^0-9]'), '');
    if (cep.length == 8) {
      return '${cep.substring(0, 5)}-${cep.substring(5)}';
    }
    return cep;
  }

  String getFieldValue(String? value) {
    return value?.isNotEmpty == true ? value! : 'Não informado';
  }

  void share() async {
    await _repository.shareText(formattedAddress);
  }

  void openInMaps() async {
    final address = [
      cepModel.logradouro,
      cepModel.bairro,
      cepModel.localidade,
      cepModel.uf,
      cepModel.cep,
    ].where((e) => e != null && e.isNotEmpty).join(', ');
    await _repository.shareToMaps(address);
  }
}
