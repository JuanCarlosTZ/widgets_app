import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/presentation/providers/theme_changer/theme_changer_provider.dart';

class ThemeChangerScreen extends ConsumerWidget {
  static String name = 'Theme_changer_screen';
  const ThemeChangerScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bool dartMode = ref.watch(dartModeProvider);

    return Scaffold(
        appBar: AppBar(
          title: const Text('Cambiar Tema'),
          actions: [
            IconButton(
              onPressed: () {
                ref.read(dartModeProvider.notifier).update((state) => !state);
              },
              icon: Icon(dartMode
                  ? Icons.dark_mode_outlined
                  : Icons.light_mode_outlined),
            )
          ],
        ),
        body: const _ThmeChangeView());
  }
}

class _ThmeChangeView extends ConsumerWidget {
  const _ThmeChangeView();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorList = ref.watch(colorListProvider);
    final colorIndex = ref.watch(colorIndexProvider);

    return ListView.builder(
      itemCount: colorList.length,
      itemBuilder: (context, index) {
        return RadioListTile(
          title: Text(
            'Aplicar este tema',
            style: TextStyle(color: colorList[index]),
          ),
          activeColor: colorList[colorIndex],
          value: index,
          groupValue: colorIndex,
          onChanged: (value) {
            ref.read(colorIndexProvider.notifier).state = value ?? index;
          },
        );
      },
    );
  }
}
