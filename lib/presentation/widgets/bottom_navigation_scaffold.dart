import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BottomNavigationScaffold extends StatefulWidget {
  const BottomNavigationScaffold({super.key, required this.navigationShell});

  final StatefulNavigationShell navigationShell;

  @override
  State<BottomNavigationScaffold> createState() =>
      _BottomNavigationScaffoldState();
}

class _BottomNavigationScaffoldState extends State<BottomNavigationScaffold> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widget.navigationShell,
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.shop_2_rounded), label: 'Shop'),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart_checkout), label: 'Cart'),
          BottomNavigationBarItem(
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
