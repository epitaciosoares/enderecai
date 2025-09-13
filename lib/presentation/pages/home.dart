import 'package:enderecai/data/models/cep_model.dart';
import 'package:enderecai/presentation/pages/cep_details_new.dart';
import 'package:enderecai/presentation/viewmodels/theme_mode_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:enderecai/core/utils/cep_input_formatter.dart';
import '../viewmodels/home_viewmodel.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;
    return ChangeNotifierProvider<HomeViewModel>(
      create: (_) => context.read<HomeViewModel>(),
      child: Consumer<HomeViewModel>(
        builder: (context, vm, _) {
          return ValueListenableBuilder<CepModel?>(
            valueListenable: vm.navigateToDetails,
            builder: (context, cepModel, child) {
              if (cepModel != null) {
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  vm.navigateToDetails.value = null;
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CepDetailsPage(cepModel: cepModel),
                    ),
                  );
                });
              }
              return Scaffold(
                backgroundColor: colorScheme.surface,
                appBar: AppBar(
                  backgroundColor: colorScheme.primary,
                  foregroundColor: colorScheme.onPrimary,
                  actions: [
                    IconButton(
                      icon: const Icon(Icons.brightness_6),
                      onPressed: () {
                        final themeVm = context.read<ThemeModeViewmodel>();
                        themeVm.setThemeMode();
                      },
                    ),
                  ],
                ),
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
                        const SizedBox(height: 8),
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.transparent,
                            borderRadius: BorderRadius.circular(100),
                          ),
                          child: Image.asset(
                            'images/icone_t.png',
                            color: colorScheme.primary,
                            width: 150,
                            height: 150,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Material(
                          elevation: 2,
                          borderRadius: BorderRadius.circular(16),
                          child: TextField(
                            controller: vm.cepController,
                            keyboardType: TextInputType.number,
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly,
                              CepInputFormatter(),
                            ],
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
                        // if (vm.result != null) ...[
                        //   const SizedBox(height: 16),
                        //   Text(
                        //     'Endereço: ${vm.result!.cep}',
                        //     style: textTheme.bodyLarge?.copyWith(
                        //       color: colorScheme.secondary,
                        //     ),
                        //   ),
                        // ],
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
