import 'package:flutter/material.dart';
import 'package:enderecai/data/models/cep_model.dart';
import 'package:enderecai/domain/repositories/cep_repository.dart';

class HomeViewModel with ChangeNotifier {
  final CepRepository _cepRepository;

  HomeViewModel(this._cepRepository);

  final TextEditingController cepController = TextEditingController();
  CepModel? result;
  String? error;
  bool isLoading = false;
  final ValueNotifier<CepModel?> navigateToDetails = ValueNotifier(null);

  Future<void> searchCep() async {
    final cep = cepController.text.trim();
    if (cep.isEmpty) {
      error = 'Digite um CEP';
      notifyListeners();
      return;
    }
    final cepRegex = RegExp(r'\d{5}-\d{3}');
    if (!cepRegex.hasMatch(cep)) {
      error = 'Digite um CEP válido (99999-999)';
      notifyListeners();
      return;
    }

    isLoading = true;
    error = null;
    notifyListeners();

    final response = await _cepRepository.getAddressFromCep(cep);
    response.fold(
      (success) {
        result = success;
        error = null;
        navigateToDetails.value = success;
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
    navigateToDetails.dispose();
    super.dispose();
  }
}
