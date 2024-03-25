import 'package:flutter/material.dart';

class AppTheme {
  final int selectedColor;

  AppTheme({required this.selectedColor})
      : assert(selectedColor >= 0 && selectedColor < colorList.length,
            'Color must be between 0 and ${colorList.length - 1}');

  ThemeData getTheme() => ThemeData(
        colorSchemeSeed: colorList[selectedColor],
        appBarTheme: const AppBarTheme(centerTitle: false),
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
