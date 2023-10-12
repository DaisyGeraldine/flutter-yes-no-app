import 'package:flutter/material.dart';

List<Color> color = [
  Colors.red,
  Colors.blue,
  Colors.green,
  Colors.yellow,
  Colors.purple,
  Colors.orange,
  Colors.pink,
  Colors.teal,
  Colors.cyan,
  Colors.amber,
  Colors.lime,
  Colors.indigo,
  Colors.brown,
  Colors.grey,
  Colors.blueGrey,
];

class AppTheme{
  final int selectedColor;
  AppTheme({
    this.selectedColor = 0
  }) : assert(selectedColor >= 0 && selectedColor < color.length, 'Color must be between 0 and ${color.length - 1}');
  ThemeData theme() {
    return ThemeData(
      colorSchemeSeed: color[selectedColor],
      useMaterial3: true,
    );
  }
}