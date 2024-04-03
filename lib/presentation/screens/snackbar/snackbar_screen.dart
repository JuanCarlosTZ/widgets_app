import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SnackbarScreen extends StatelessWidget {
  static String name = 'snackbar_screen';
  const SnackbarScreen({super.key});

  void _showSnackbar(BuildContext context) {
    final scaffoldMessager = ScaffoldMessenger.of(context);
    final snackbar = SnackBar(
      duration: const Duration(seconds: 2),
      content: const Text('Quis sunt occaecat officia deseruntteur.'),
      action: SnackBarAction(label: 'OK!', onPressed: () {}),
    );

    scaffoldMessager.clearSnackBars();
    scaffoldMessager.showSnackBar(snackbar);
  }

  void _showDialog(BuildContext context) {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => AlertDialog(
              title: const Text('¿Estás seguro?'),
              content: const Text(
                  'Reprehenderit minim dolor quis sit ullamco est officia veniam. Excepteur est et incididunt eu velit exercitation aliquip. Consequat qui dolor ea sint.'),
              actions: [
                TextButton(
                    onPressed: () => context.pop(),
                    child: const Text('Cancelar')),
                FilledButton(
                    onPressed: () => Navigator.of(context).pop(),
                    child: const Text('Aceptar'))
              ],
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Snackbar & Dialog')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FilledButton.tonal(
                onPressed: () {
                  showAboutDialog(
                    barrierDismissible: false,
                    barrierLabel: 'Barrien Label',
                    context: context,
                    children: [
                      const Text(
                          'Quis deserunt amet Lorem id fugiat Lorem tempor. Tempor qui nisi esse nisi non mollit. In aliqua dolor sint proident et commodo nostrud. Cupidatat tempor sint dolor eu incididunt. Non laboris nulla fugiat proident aliqua laboris.')
                    ],
                  );
                },
                child: const Text('Licencias usadas')),
            const SizedBox(height: 10),
            FilledButton.tonal(
                onPressed: () => _showDialog(context),
                child: const Text('Mostrar diálogo')),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => _showSnackbar(context),
        label: const Text('Mostrar snackbar'),
      ),
    );
  }
}
