import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:resistor_app/app_module.dart';
import 'package:resistor_app/theme/app_theme.dart';

void main() {
  runApp(ModularApp(module: AppModule(), child: const MainApp()));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: "Resistance",
      routerConfig: Modular.routerConfig,
      theme: AppTheme().themeData, // TODO: Inject this in AppModule
    );
  }
}
