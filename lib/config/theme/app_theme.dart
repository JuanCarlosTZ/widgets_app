import 'package:flutter/material.dart';

class AppTheme {
  final int selectedColor;
  final bool isDartMode;

  AppTheme({required this.selectedColor, this.isDartMode = false})
      : assert(selectedColor >= 0 && selectedColor < colorList.length,
            'Color must be between 0 and ${colorList.length - 1}');

  ThemeData getTheme() => ThemeData(
        colorSchemeSeed: colorList[selectedColor],
        appBarTheme: const AppBarTheme(centerTitle: false),
        brightness: isDartMode ? Brightness.dark : Brightness.light,
      );

  AppTheme copyWith({int? selectedColor, bool? isDartMode}) {
    selectedColor = selectedColor ?? this.selectedColor;
    isDartMode = isDartMode ?? this.isDartMode;
    assert(selectedColor >= 0 && selectedColor < colorList.length,
        'Color must be between 0 and ${colorList.length - 1}');

    return AppTheme(selectedColor: selectedColor, isDartMode: isDartMode);
  }
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
