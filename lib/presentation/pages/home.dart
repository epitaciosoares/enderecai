import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../viewmodels/home_viewmodel.dart';

class Home extends StatelessWidget {
  const Home({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;
    return ChangeNotifierProvider<HomeViewModel>(
      create: (_) => context.read<HomeViewModel>(),
      child: Consumer<HomeViewModel>(
        builder: (context, vm, _) {
          return Scaffold(
            backgroundColor: colorScheme.surface,
            body: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Endereçaí',
                      style: textTheme.displayMedium?.copyWith(
                        color: colorScheme.primary,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 32),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: Icon(
                        Icons.location_on,
                        color: colorScheme.primary,
                        size: 100,
                      ),
                    ),
                    const SizedBox(height: 32),
                    Material(
                      elevation: 2,
                      borderRadius: BorderRadius.circular(16),
                      child: TextField(
                        controller: vm.cepController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          hintText: 'Digite o CEP',
                          filled: true,
                          fillColor: theme.cardColor,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                            borderSide: BorderSide.none,
                          ),
                          contentPadding: const EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 18,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton.icon(
                        onPressed: vm.isLoading ? null : vm.searchCep,
                        icon: const Icon(Icons.search),
                        label: const Text('Buscar'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: colorScheme.primary,
                          foregroundColor: colorScheme.onPrimary,
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                        ),
                      ),
                    ),
                    if (vm.isLoading) ...[
                      const SizedBox(height: 16),
                      CircularProgressIndicator(color: colorScheme.primary),
                    ],
                    if (vm.error != null) ...[
                      const SizedBox(height: 16),
                      Text(
                        vm.error!,
                        style: textTheme.bodyMedium?.copyWith(
                          color: colorScheme.error,
                        ),
                      ),
                    ],
                    if (vm.result != null) ...[
                      const SizedBox(height: 16),
                      Text(
                        'Endereço: ${vm.result!.cep}',
                        style: textTheme.bodyLarge?.copyWith(
                          color: colorScheme.secondary,
                        ),
                      ),
                    ],
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
