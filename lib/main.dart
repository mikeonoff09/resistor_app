import 'package:flutter/material.dart';
import 'package:resistor_app/config/router/app_router.dart';
import 'package:resistor_app/theme/app_theme.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: "Resistance",
      routerConfig: appRouter,
      theme: AppTheme().themeData,
    );
  }
}
