import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:widgets_app/infraestructure/datasources/local_ui_controls_source_impl.dart';
import 'package:widgets_app/infraestructure/repositories/ui_controls_repository_imp.dart';
import 'package:widgets_app/presentation/providers/ui_controls/ui_controls_provider.dart';

class UiControlsScreen extends StatelessWidget {
  static String name = 'ui_controls_screen';

  const UiControlsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('UI Controls'),
      ),
      body: _UiControlsView(),
    );
  }
}

class _UiControlsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final provider = context.watch<UiControlsProvider>();
    final transportation = provider.transportationSelected;
    final datasource = LocalUiControlsSourceImpl();
    final repository = UiControlsRepositoryImpl(datasource);

    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) {
            return UiControlsProvider(repository);
          })
        ],
        child: ListView(
          children: [
            SwitchListTile(
              title: const Text('Develop mode'),
              subtitle: const Text('Controles adicionales'),
              value: provider.isDevelop,
              onChanged: (value) {
                provider.setDevelopMode(value);
              },
            ),
            ExpansionTile(
              title: const Text('Vehículo de transporte'),
              subtitle: Text(transportation?.toString() ?? 'Seleccionar'),
              controller: provider.controller,
              children: [
                ...provider.transportations.map(
                  (transport) {
                    return RadioListTile(
                      title: Text(transport.type.name),
                      subtitle: Text(transport.caption),
                      value: transport,
                      groupValue: provider.transportationSelected,
                      onChanged: (value) {
                        if (value == null) return;
                        provider.setTransportation(value);
                      },
                    );
                  },
                )
              ],
            ),
            ...provider.dishes.map((dish) => CheckboxListTile(
                  title: Text(dish.caption),
                  value: dish.included,
                  onChanged: (value) {
                    final dishes = provider.dishes;
                    final index = dishes.indexOf(dish);

                    dishes[index].included = value ?? false;
                    provider.setDishes(dishes);
                  },
                )),
          ],
        ));
  }
}
