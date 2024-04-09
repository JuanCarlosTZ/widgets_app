import 'package:flutter/material.dart';

class AppTheme {
  final int selectedColor;
  final bool _isDartMode;

  AppTheme({required this.selectedColor, bool isDartMode = false})
      : assert(selectedColor >= 0 && selectedColor < colorList.length,
            'Color must be between 0 and ${colorList.length - 1}'),
        _isDartMode = isDartMode;

  ThemeData getTheme() => ThemeData(
        colorSchemeSeed: colorList[selectedColor],
        appBarTheme: const AppBarTheme(centerTitle: false),
        brightness: _isDartMode ? Brightness.dark : Brightness.light,
      );
}

const List<Color> colorList = [
  Colors.green,
  Colors.teal,
  Colors.pink,
  Colors.red,
  Colors.blue,
  Colors.yellow,
  Colors.purple,
];
