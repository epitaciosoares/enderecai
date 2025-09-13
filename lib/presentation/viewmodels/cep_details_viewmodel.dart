import 'package:flutter/material.dart';
import 'package:enderecai/data/models/cep_model.dart';

class CepDetailsViewModel extends ChangeNotifier {
  final CepModel cepModel;

  CepDetailsViewModel(this.cepModel);

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

  void share() {
    // TODO: Implementar compartilhamento do endereço
    // Pode ser implementado usando o package share_plus
  }

  void openInMaps() {
    // TODO: Implementar abertura no maps
    // Pode ser implementado usando url_launcher para abrir o Google Maps
  }
}
