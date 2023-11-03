import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_academy_online_shop/presentation/store/products_store.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
// Local imports
import 'package:flutter_academy_online_shop/router/router_config.dart';
import 'package:flutter_academy_online_shop/di/di.dart';

class ShopScreen extends StatefulWidget {
  const ShopScreen({super.key});

  @override
  State<ShopScreen> createState() => _ShopScreenState();
}

class _ShopScreenState extends State<ShopScreen> {
  final _store = DI.get<ProductsStore>();

  @override
  void initState() {
    _store.fetchProductsAndCategories();
    super.initState();
  }

  @override
  Widget build(final BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppLocalizations.of(context)!.shopPageTitle,
          style: const TextStyle(color: Colors.white),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Center(
            child: Column(
          children: [
            FilledButton(
              child: const Text('Fetch Products'),
              onPressed: () {
                _store.fetchProductsAndCategories();
              },
            ),
            TextButton(
              child: const Text('Click for more de1tails'),
              onPressed: () => context
                  .goNamed(AppRouter.detailsName, pathParameters: {'id': '20'}),
            ),
            ..._store.allCategories
                .map(
                  (e) => Text(e),
                )
                .toList(),
          ],
        )),
      ),
    );
  }
}
