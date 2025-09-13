import 'package:flutter/material.dart';
import 'package:enderecai/data/models/cep_model.dart';
import 'package:enderecai/domain/repositories/cep_repository.dart';

class HomeViewModel with ChangeNotifier {
  final CepRepository cepRepository;

  HomeViewModel(this.cepRepository);

  final TextEditingController cepController = TextEditingController();
  CepModel? result;
  String? error;
  bool isLoading = false;

  Future<void> searchCep() async {
    final cep = cepController.text.trim();
    if (cep.isEmpty) {
      error = 'Digite um CEP válido';
      notifyListeners();
      return;
    }
    isLoading = true;
    error = null;
    notifyListeners();
    final response = await cepRepository.getAddressFromCep(cep);
    response.fold(
      (success) {
        result = success;
        error = null;
      },
      (failure) {
        result = null;
        error = 'CEP não encontrado';
      },
    );
    isLoading = false;
    notifyListeners();
  }

  @override
  void dispose() {
    cepController.dispose();
    super.dispose();
  }
}
