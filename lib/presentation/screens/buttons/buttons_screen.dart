import 'package:flutter/material.dart';

class ButtonsScreen extends StatelessWidget {
  static const String name = 'buttons';

  const ButtonsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Buttons')),
      body: const _ButtonsView(),
    );
  }
}

class _ButtonsView extends StatelessWidget {
  const _ButtonsView();

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        alignment: Alignment.topCenter,
        child: Wrap(
          spacing: 10,
          children: [
            ElevatedButton(
              child: const Text('Elevated Button'),
              onPressed: () {},
            ),
            const ElevatedButton(
              onPressed: null,
              child: Text('Elevated Disabled'),
            ),
            ElevatedButton.icon(
              icon: const Icon(Icons.access_alarm_rounded),
              label: const Text('Elevated'),
              onPressed: () {},
            ),
            FilledButton(
              child: const Text('Filled'),
              onPressed: () {},
            ),
            FilledButton.icon(
              icon: const Icon(Icons.beach_access),
              label: const Text('Filled'),
              onPressed: () {},
            ),
            OutlinedButton(onPressed: () {}, child: const Text('Outlined')),
            OutlinedButton.icon(
              icon: const Icon(Icons.beach_access),
              label: const Text('Filled'),
              onPressed: () {},
            ),
            TextButton(onPressed: () {}, child: const Text('Text')),
            TextButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.favorite),
                label: const Text('Text')),
            const _CustomButton(),
            const _CustomButtonGradient(),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.calendar_month),
            ),
            IconButton.filled(
              onPressed: () {},
              icon: const Icon(Icons.calendar_month),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.calendar_month),
              color: color.primary,
            ),
          ],
        ),
      ),
    );
  }
}

class _CustomButton extends StatelessWidget {
  const _CustomButton();

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme;

    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Material(
        color: color.primary,
        child: InkWell(
          onTap: () {},
          child: const Padding(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            child: Text('Custom Button',
                style: TextStyle(
                    color: Colors.white, fontWeight: FontWeight.w500)),
          ),
        ),
      ),
    );
  }
}

class _CustomButtonGradient extends StatelessWidget {
  const _CustomButtonGradient();

  @override
  Widget build(BuildContext context) {
    const stackChild = Padding(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: Text('Custom Button Gradient',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500)),
    );
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              gradient: const LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Colors.blue,
                  Colors.green
                ], // Puedes cambiar los colores del gradiente según tus preferencias
              ),
            ),
            child: stackChild,
          ),
          Material(
            color: Colors
                .transparent, // Hacemos el color transparente para que el gradiente sea visible
            child: InkWell(
              onTap: () {},
              child: stackChild,
            ),
          ),
        ],
      ),
    );
  }
}
