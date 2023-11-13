import 'package:flutter/material.dart';
import 'package:flutter_academy_online_shop/presentation/store/shop_store.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
// Local imports
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_academy_online_shop/di/di.dart';
import 'package:flutter_academy_online_shop/presentation/widgets/shop_filters.dart';
import 'package:flutter_academy_online_shop/presentation/widgets/product_list.dart';

import '../../auth/auth.dart';

class ShopScreen extends StatelessWidget {
  ShopScreen({super.key});

  final _store = DI.get<ShopStore>();
  final _currentUser = Auth().currentUser;
  @override
  Widget build(final BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppLocalizations.of(context)!.shopPageTitle,
          style: const TextStyle(color: Colors.white),
        ),
        actions: <Widget>[
          Text(
              _currentUser != null ? _currentUser?.email as String : ''
          ),
          IconButton(
            onPressed: () => Auth().signOut(),
            icon: const Icon(Icons.logout_outlined),
          ),
        ],
      ),
      body: Center(
        child: Column(
          children: [
            const ShopFilters(),
            Observer(
              builder: (BuildContext context) {
                final products = _store.filteredProducts;

                if (_store.isLoading) {
                  return const Expanded(
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                }

                return Expanded(
                  child: ProductList(products: products),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
