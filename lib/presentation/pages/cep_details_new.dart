import 'package:enderecai/core/dependency_injector/injector.dart';
import 'package:enderecai/domain/repositories/share_repository.dart';
import 'package:flutter/material.dart';
import 'package:enderecai/data/models/cep_model.dart';
import 'package:enderecai/presentation/viewmodels/cep_details_viewmodel.dart';
import 'package:provider/provider.dart';

class CepDetailsPage extends StatelessWidget {
  final CepModel cepModel;

  const CepDetailsPage({super.key, required this.cepModel});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => CepDetailsViewModel(
        cepModel,
        dependencyInjector.get<ShareRepository>(),
      ),
      child: const _CepDetailsView(),
    );
  }
}

class _CepDetailsView extends StatelessWidget {
  const _CepDetailsView();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final vm = context.watch<CepDetailsViewModel>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Detalhes do Endereço'),
        backgroundColor: colorScheme.primary,
        foregroundColor: colorScheme.onPrimary,
        actions: [
          IconButton(icon: const Icon(Icons.share), onPressed: vm.share),
          IconButton(icon: const Icon(Icons.map), onPressed: vm.openInMaps),
        ],
      ),
      backgroundColor: colorScheme.surface,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildInfoCard(
              theme: theme,
              title: 'CEP',
              content: vm.formattedCep,
              icon: Icons.pin_drop,
            ),
            const SizedBox(height: 16),
            _buildInfoCard(
              theme: theme,
              title: 'Logradouro',
              content: vm.getFieldValue(vm.cepModel.logradouro),
              icon: Icons.route,
            ),
            const SizedBox(height: 16),
            _buildInfoCard(
              theme: theme,
              title: 'Bairro',
              content: vm.getFieldValue(vm.cepModel.bairro),
              icon: Icons.location_city,
            ),
            const SizedBox(height: 16),
            _buildInfoCard(
              theme: theme,
              title: 'Cidade/UF',
              content: vm.formattedAddress,
              icon: Icons.business,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoCard({
    required ThemeData theme,
    required String title,
    required String content,
    required IconData icon,
  }) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            Icon(icon, color: theme.colorScheme.primary),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: theme.textTheme.titleSmall?.copyWith(
                      color: theme.colorScheme.onSurfaceVariant,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    content,
                    style: theme.textTheme.titleMedium?.copyWith(
                      color: theme.colorScheme.onSurface,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
