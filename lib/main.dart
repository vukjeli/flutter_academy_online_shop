import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:adaptive_theme/adaptive_theme.dart';
// Local imports
import 'package:flutter_academy_online_shop/di/di.dart';
import 'package:flutter_academy_online_shop/l10n/l10.dart';
import 'package:flutter_academy_online_shop/presentation/store/shop_store.dart';
import 'router/router_config.dart';
import 'theme/theme_config.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
        apiKey: 'AIzaSyCELVoUUAKt4OGH-kgeirJ6kPVib8opIfI',
        appId: '1:879630204661:android:6199f722b1eb74a47e4fbc',
        messagingSenderId: '879630204661',
        projectId: 'flutteronlineshop-60767'
    )
  );
  DI.setup();

  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  MainAppState createState() => MainAppState();
}

class MainAppState extends State<MainApp> {
  final _store = DI.get<ShopStore>();

  @override
  void initState() {
    super.initState();
    _store.fetchProductsAndCategories();
  }

  @override
  Widget build(BuildContext context) {
    return AdaptiveTheme(
      light: lightTheme,
      dark: darkTheme,
      initial: AdaptiveThemeMode.system,
      builder: (theme, darkTheme) => MaterialApp.router(
        theme: theme,
        darkTheme: darkTheme,
        localizationsDelegates: L10n.delegates,
        supportedLocales: L10n.locales,
        locale: const Locale('en'),
        routerConfig: AppRouter.router,
      ),
    );
  }
}
