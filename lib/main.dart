import 'package:flutter/material.dart';
// Local imports
import 'package:flutter_academy_online_shop/di/di.dart';
import 'package:flutter_academy_online_shop/l10n/l10.dart';
import 'package:flutter_academy_online_shop/presentation/store/products_store.dart';
import 'router/router_config.dart';
import 'theme/theme_config.dart';

void main() {
  DI.setup();

  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  MainAppState createState() => MainAppState();
}

class MainAppState extends State<MainApp> {
  final _store = DI.get<ProductsStore>();

  @override
  void initState() {
    super.initState();
    _store.fetchProductsAndCategories();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      // theme: darkTheme,
      theme: lightTheme,
      darkTheme: darkTheme,
      localizationsDelegates: L10n.delegates,
      supportedLocales: L10n.locales,
      locale: const Locale('en'),
      routerConfig: AppRouter.router,
    );
  }
}
