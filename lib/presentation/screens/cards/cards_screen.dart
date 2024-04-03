import 'package:flutter/material.dart';
import 'package:widgets_app/infraestructure/model/cards_model.dart';

final cards = <Map<String, dynamic>>[
  {'elevation': 0.0, 'label': 'Elevation 0'},
  {'elevation': 1.0, 'label': 'Elevation 1'},
  {'elevation': 2.0, 'label': 'Elevation 2'},
  {'elevation': 3.0, 'label': 'Elevation 3'},
  {'elevation': 4.0, 'label': 'Elevation 4'},
  {'elevation': 5.0, 'label': 'Elevation 5'},
  {'elevation': 6.0, 'label': 'Elevation 6'},
  {'elevation': 7.0, 'label': 'Elevation 7'},
].map((card) => CardsModel.fromJson(card).toCardElement()).toList();

class CardsScreen extends StatelessWidget {
  static const String name = 'cards';

  const CardsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Cards')),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ...cards.map((card) =>
                _CardView(elevation: card.elevation, label: card.label)),
            ...cards.map((card) =>
                _CardView2(elevation: card.elevation, label: card.label)),
            ...cards.map((card) =>
                _CardView3(elevation: card.elevation, label: card.label)),
            ...cards.map((card) =>
                _CardView4(elevation: card.elevation, label: card.label)),
          ],
        ),
      ),
    );
  }
}

class _CardView extends StatelessWidget {
  final double elevation;
  final String label;

  const _CardView({
    required this.elevation,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: elevation,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(10, 0, 0, 10),
        child: Column(
          children: [
            Align(
              alignment: Alignment.topRight,
              child: IconButton(
                icon: const Icon(Icons.more_vert_outlined),
                onPressed: () {},
              ),
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: Text(label),
            )
          ],
        ),
      ),
    );
  }
}

class _CardView2 extends StatelessWidget {
  final double elevation;
  final String label;

  const _CardView2({
    required this.elevation,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme;
    return Card(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
          side: BorderSide(
            color: color.outline,
          )),
      elevation: elevation,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(10, 0, 0, 10),
        child: Column(
          children: [
            Align(
              alignment: Alignment.topRight,
              child: IconButton(
                icon: const Icon(Icons.more_vert_outlined),
                onPressed: () {},
              ),
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: Text(label),
            )
          ],
        ),
      ),
    );
  }
}

class _CardView3 extends StatelessWidget {
  final double elevation;
  final String label;

  const _CardView3({
    required this.elevation,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme;
    return Card(
      color: color.outlineVariant,
      elevation: elevation,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(10, 0, 0, 10),
        child: Column(
          children: [
            Align(
              alignment: Alignment.topRight,
              child: IconButton(
                icon: const Icon(Icons.more_vert_outlined),
                onPressed: () {},
              ),
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: Text(label),
            )
          ],
        ),
      ),
    );
  }
}

class _CardView4 extends StatelessWidget {
  final double elevation;
  final String label;

  const _CardView4({
    required this.elevation,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme;
    return Card(
      color: color.outlineVariant,
      clipBehavior: Clip.hardEdge,
      elevation: elevation,
      child: Stack(
        children: [
          Image.network(
              'https://picsum.photos/id/32${elevation.toInt()}/600/350'),
          Align(
            alignment: Alignment.topRight,
            child: Material(
              borderRadius: BorderRadius.circular(12),
              color: color.onPrimary.withOpacity(0.2),
              child: IconButton(
                color: color.onPrimaryContainer,
                icon: const Icon(Icons.more_vert_outlined),
                onPressed: () {},
              ),
            ),
          ),
        ],
      ),
    );
  }
}
