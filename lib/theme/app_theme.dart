import 'package:flutter/material.dart';

class AppTheme {
  ThemeData get themeData => ThemeData(
        useMaterial3: true,
        colorSchemeSeed: const Color.fromARGB(255, 98, 82, 229),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      );
}
