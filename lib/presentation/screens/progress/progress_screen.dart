import 'package:flutter/material.dart';

class ProgressScreen extends StatelessWidget {
  static String name = 'progress_screen';
  const ProgressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Progress Indicator')),
      body: const _ProgressView(),
    );
  }
}

class _ProgressView extends StatelessWidget {
  const _ProgressView();

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Center(
        child: Column(
          children: [
            const Text('Indicador de progreso circular'),
            const SizedBox(height: 10),
            CircularProgressIndicator(
                strokeWidth: 2, backgroundColor: colors.outlineVariant),
            const SizedBox(height: 20),
            const Text('Indicador de progreso finito'),
            const SizedBox(height: 10),
            const _FinitiveIndicator()
          ],
        ),
      ),
    );
  }
}

class _FinitiveIndicator extends StatelessWidget {
  const _FinitiveIndicator();

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return StreamBuilder(
      stream: Stream.periodic(const Duration(milliseconds: 300), (value) {
        return value * 5 / 100;
      }).takeWhile((element) {
        return element <= 1;
      }),
      builder: (context, snapshot) {
        final progress = snapshot.data ?? 0;
        return SafeArea(
          child: Row(
            children: [
              CircularProgressIndicator(
                strokeWidth: 2,
                value: progress,
                backgroundColor: colors.outlineVariant,
              ),
              const SizedBox(width: 20),
              Expanded(child: LinearProgressIndicator(value: progress)),
            ],
          ),
        );
      },
    );
  }
}
