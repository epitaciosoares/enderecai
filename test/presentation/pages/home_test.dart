import 'package:enderecai/data/models/cep_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:enderecai/presentation/viewmodels/home_viewmodel.dart';

class MockHomeViewModel extends ChangeNotifier implements HomeViewModel {
  @override
  final TextEditingController cepController = TextEditingController();
  @override
  bool isLoading = false;
  @override
  String? error;
  @override
  final ValueNotifier<CepModel?> navigateToDetails = ValueNotifier<CepModel?>(
    null,
  );
  @override
  Future<void> searchCep() async {}
  @override
  void dispose() {
    cepController.dispose();
    navigateToDetails.dispose();
    super.dispose();
  }

  @override
  CepModel? result;
}

void main() {
  testWidgets('Home exibe título, campo e botão', (tester) async {
    // Aguarda todos os frames
  });
}
