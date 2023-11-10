import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_academy_online_shop/di/di.dart';
import 'package:flutter_academy_online_shop/presentation/store/shop_store.dart';
import 'package:flutter_academy_online_shop/presentation/widgets/shopping_cart_item.dart';

class CartScreen extends StatelessWidget {
  CartScreen({super.key});

  final _store = DI.get<ShopStore>();

  @override
  Widget build(final BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppLocalizations.of(context)!.cartPageTitle,
          style: const TextStyle(color: Colors.white),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        width: double.infinity,
        child: Observer(
          builder: (BuildContext context) {
            if (_store.shoppingCart.isNotEmpty) {
              final totalPrice = _store.shoppingCart.fold(
                  0,
                  (num prev, element) =>
                      prev + element.itemPrice * element.amount);

              return Column(
                children: [
                  Expanded(
                    child: ListView.separated(
                      itemCount: _store.shoppingCart.length,
                      separatorBuilder: (BuildContext context, int index) =>
                          const SizedBox(
                        height: 10,
                      ),
                      itemBuilder: (context, index) {
                        final item = _store.shoppingCart[index];
                        final product = _store.allProducts.firstWhere(
                            (product) =>
                                product.id == _store.shoppingCart[index].id);

                        return ShoppingCartItem(
                          id: item.id,
                          counter: item.amount,
                          title: product.title,
                          imageUrl: product.image,
                          itemIndex: index,
                        );
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              AppLocalizations.of(context)!.total,
                              style: const TextStyle(fontSize: 18),
                            ),
                            Text('\$${totalPrice.toStringAsFixed(2)}',
                                style: const TextStyle(fontSize: 24)),
                          ],
                        ),
                        FilledButton(
                          onPressed: () {},
                          style: ButtonStyle(
                            fixedSize: MaterialStateProperty.all(
                              const Size.fromHeight(60),
                            ),
                          ),
                          child: Text(
                            AppLocalizations.of(context)!.payNow,
                            style: const TextStyle(
                              fontSize: 22,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            }

            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Padding(
                  padding: EdgeInsets.only(bottom: 20),
                  child: Icon(
                    Icons.remove_shopping_cart_outlined,
                    size: 100,
                  ),
                ),
                Text(
                  AppLocalizations.of(context)!.emptyCartMessage,
                  style: const TextStyle(fontSize: 20),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
// Text(AppLocalizations.of(context)!.helloWorld),
