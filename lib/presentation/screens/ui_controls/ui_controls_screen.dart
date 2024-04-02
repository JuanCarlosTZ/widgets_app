import 'package:flutter/material.dart';
import 'package:widgets_app/domain/dishes_element.dart';
import 'package:widgets_app/domain/transportation.dart';
import 'package:widgets_app/model/dishes_model.dart';
import 'package:widgets_app/model/transportation_model.dart';

class UiControlsScreen extends StatelessWidget {
  static String name = 'ui_controls_screen';

  const UiControlsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('UI Controls'),
      ),
      body: const _UIControlsView(),
    );
  }
}

class _UIControlsView extends StatefulWidget {
  const _UIControlsView();

  @override
  State<_UIControlsView> createState() => _UIControlsViewState();
}

class _UIControlsViewState extends State<_UIControlsView> {
  final controller = ExpansionTileController();
  bool isDevelop = false;

  Transportation transportationSelected =
      Transportation(caption: 'Viaje por carro', type: TransportationType.car);
  final List<DishesElement> dishes =
      dishesList.map((e) => DishesModel.fromJson(e).toDishesElement()).toList();

  Widget radioElement(Transportation transport) {
    return RadioListTile(
      title: Text(transport.type.name),
      subtitle: Text(transport.caption),
      value: transport.type,
      groupValue: transportationSelected.type,
      onChanged: (value) {
        setState(() {
          if (value == null) return;
          transportationSelected =
              Transportation(caption: transport.caption, type: value);
          controller.collapse();
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        SwitchListTile(
          title: const Text('Develop mode'),
          subtitle: const Text('Controles adicionales'),
          value: isDevelop,
          onChanged: (value) {
            setState(() {
              isDevelop = value;
            });
          },
        ),
        ExpansionTile(
          title: const Text('Vehículo de transporte'),
          subtitle: Text(
              '${transportationSelected.type.name} - ${transportationSelected.caption}'),
          controller: controller,
          children: [
            ...transportations.map(
              (json) {
                final transport =
                    TransportationModel.fromJson(json).toTransportation();
                return radioElement(transport);
              },
            )
          ],
        ),
        ...dishes.map(
          (e) => CheckboxListTile(
              title: Text(e.caption),
              value: e.included,
              onChanged: (value) => setState(() {
                    final index = dishes.indexOf(e);
                    dishes[index].included = value ?? false;
                  })),
        )
      ],
    );
  }
}
