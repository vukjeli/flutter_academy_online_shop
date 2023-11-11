import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_academy_online_shop/di/di.dart';
import 'package:flutter_academy_online_shop/presentation/store/shop_store.dart';
import 'package:flutter_academy_online_shop/presentation/widgets/shopping_cart_item.dart';

class CartScreen extends StatelessWidget {
  CartScreen({super.key});

  final _store = DI.get<ShopStore>();

  bool isPaymentFinished = false;

  void _onCheckout() async {
    try {
      await _store.checkout();
    } catch (ex) {}
  }

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
            if (_store.isPaymentCompleted) {
              return Center(
                child: Text(AppLocalizations.of(context)!.paymentFinished),
              );
            }

            if (_store.shoppingCart.isNotEmpty) {
              final totalPrice = _store.shoppingCart.fold(
                  0,
                  (num prev, element) =>
                      prev + element.product.price * element.amount);

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

                        return ShoppingCartItem(
                          product: item.product,
                          amount: item.amount,
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
                          onPressed: _store.isPaymentInProgress
                              ? null
                              : () {
                                  _onCheckout();
                                },
                          style: ButtonStyle(
                            fixedSize: MaterialStateProperty.all(
                              const Size(150, 60),
                            ),
                          ),
                          child: _store.isPaymentInProgress
                              ? const CircularProgressIndicator(
                                  color: Colors.white,
                                  strokeWidth: 3,
                                )
                              : Text(
                                  AppLocalizations.of(context)!.checkout,
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
