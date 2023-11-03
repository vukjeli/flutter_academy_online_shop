import 'package:flutter/material.dart';
// Local imports
import 'package:flutter_academy_online_shop/di/di.dart';
import 'package:flutter_academy_online_shop/l10n/l10.dart';
import 'router/router_config.dart';
import 'theme/theme_config.dart';

void main() {
  DI.setup();

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: lightTheme,
      darkTheme: darkTheme,
      localizationsDelegates: L10n.delegates,
      supportedLocales: L10n.locales,
      locale: const Locale('en'),
      routerConfig: AppRouter.router,
    );
  }
}
