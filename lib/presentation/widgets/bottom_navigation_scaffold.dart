import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:badges/badges.dart' as badges;
import 'package:flutter_mobx/flutter_mobx.dart';

import 'package:flutter_academy_online_shop/di/di.dart';
import 'package:flutter_academy_online_shop/presentation/store/shop_store.dart';

class BottomNavigationScaffold extends StatefulWidget {
  const BottomNavigationScaffold({super.key, required this.navigationShell});

  final StatefulNavigationShell navigationShell;

  @override
  State<BottomNavigationScaffold> createState() =>
      _BottomNavigationScaffoldState();
}

class _BottomNavigationScaffoldState extends State<BottomNavigationScaffold> {
  final _store = DI.get<ShopStore>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widget.navigationShell,
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: [
          const BottomNavigationBarItem(
              icon: Icon(Icons.shop_2_rounded), label: 'Shop'),
          BottomNavigationBarItem(
              icon: Observer(
                builder: (BuildContext context) {
                  final numOfItems = _store.shoppingCart.fold(
                    0,
                    (previousValue, element) => previousValue + element.amount,
                  );

                  return badges.Badge(
                    showBadge: numOfItems > 0,
                    badgeContent: Text(
                      "$numOfItems",
                      style: const TextStyle(color: Colors.white),
                    ),
                    position: badges.BadgePosition.topEnd(top: -15, end: -12),
                    child: const Icon(Icons.shopping_cart_checkout),
                  );
                },
              ),
              label: 'Cart'),
          const BottomNavigationBarItem(
              icon: Icon(Icons.settings_applications), label: 'Settings'),
        ],
        currentIndex: widget.navigationShell.currentIndex,
        onTap: (index) {
          widget.navigationShell.goBranch(index,
              initialLocation: index == widget.navigationShell.currentIndex);
          setState(() {});
        },
      ),
    );
  }
}
