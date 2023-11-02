import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
// Local imports
import 'package:flutter_academy_online_shop/presentation/screens/cart_screen.dart';
import 'package:flutter_academy_online_shop/presentation/screens/details_screen.dart';
import 'package:flutter_academy_online_shop/presentation/screens/login_screen.dart';
import 'package:flutter_academy_online_shop/presentation/screens/settings_screen.dart';
import 'package:flutter_academy_online_shop/presentation/screens/shop_screen.dart';
import 'package:flutter_academy_online_shop/presentation/widgets/bottom_navigation_scaffold.dart';

class AppRouter {
  static const loginPath = '/login';
  static const loginName = 'login';
  static const shopPath = '/shop';
  static const shopName = 'shop';
  static const detailsPath = ':id';
  static const detailsName = 'details';
  static const settingsPath = '/settings';
  static const settingsName = 'settings';
  static const cartPath = '/cart';
  static const cartName = 'cart';

  static final _rootNavigatorKey = GlobalKey<NavigatorState>();
  static final _shopTabNavigatorKey = GlobalKey<NavigatorState>();
  static final _cartTabNavigatorKey = GlobalKey<NavigatorState>();
  static final _settingsTabNavigatorKey = GlobalKey<NavigatorState>();

  static final router = GoRouter(
      initialLocation: loginPath,
      navigatorKey: _rootNavigatorKey,
      routes: [
        StatefulShellRoute.indexedStack(
          parentNavigatorKey: _rootNavigatorKey,
          builder: (context, state, navigationShell) {
            return BottomNavigationScaffold(navigationShell: navigationShell);
          },
          branches: [
            StatefulShellBranch(
              navigatorKey: _shopTabNavigatorKey,
              routes: [
                GoRoute(
                  path: shopPath,
                  name: shopName,
                  builder: (context, state) => const ShopScreen(),
                  routes: [
                    GoRoute(
                      path: detailsPath,
                      name: detailsName,
                      builder: (context, state) => const DetailsScreen(),
                    )
                  ],
                ),
              ],
            ),
            StatefulShellBranch(
              navigatorKey: _cartTabNavigatorKey,
              routes: [
                GoRoute(
                  path: cartPath,
                  name: cartName,
                  builder: (context, state) => const CartScreen(),
                ),
              ],
            ),
            StatefulShellBranch(
              navigatorKey: _settingsTabNavigatorKey,
              routes: [
                GoRoute(
                  path: settingsPath,
                  name: settingsName,
                  builder: (context, state) => const SettingsScreen(),
                ),
              ],
            ),
          ],
        ),
        GoRoute(
          parentNavigatorKey: _rootNavigatorKey,
          path: loginPath,
          name: loginName,
          builder: (context, state) => const LoginScreen(),
        ),
      ]);
}
