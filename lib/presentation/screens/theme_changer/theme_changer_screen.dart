import 'package:flutter/material.dart';

class ThemeChangerScreen extends StatelessWidget {
  static String name = 'Theme_changer_screen';
  const ThemeChangerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Carmbiar Tema'),
      ),
    );
  }
}
