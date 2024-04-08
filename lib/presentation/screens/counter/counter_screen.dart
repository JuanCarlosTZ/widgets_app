import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/presentation/providers/counter/couter_provider.dart';
import 'package:widgets_app/presentation/providers/counter/theme_counter_provider.dart';

class CounterScreen extends ConsumerWidget {
  static String name = 'counter_screen';
  const CounterScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final style = Theme.of(context).textTheme;
    final clicksCounter = ref.watch(CounterProvider.clickCounter);
    final header = clicksCounter == 1 ? 'Click' : 'Clicks';
    final dartModeProvider = ref.read(ThemeCounterProvider.dartMode.notifier);
    final dartMode = ref.watch(ThemeCounterProvider.dartMode);
    final iconMode =
        dartMode ? Icons.dark_mode_outlined : Icons.light_mode_outlined;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contador con Riverpod'),
        actions: [
          IconButton(
            onPressed: () {
              dartModeProvider.update((state) => !state);
            },
            icon: Icon(iconMode),
          )
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('$clicksCounter', style: style.headlineLarge),
            Text(
              header,
              style: style.headlineSmall,
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ref.read(CounterProvider.clickCounter.notifier).state++;
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
