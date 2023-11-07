import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:resistor_app/app_module.dart';
import 'package:resistor_app/theme/app_theme.dart';
import 'package:resistor_app/utils/firebase_initializer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  FirebaseInitializer.initialize();

  runApp(ModularApp(module: AppModule(), child: const MainApp()));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: "Resistance",
      routerConfig: Modular.routerConfig,
      theme:
          AppTheme().themeData, // TODO: Inject this as singleton in AppModule
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en'),
        Locale('es'),
      ],
    );
  }
}
