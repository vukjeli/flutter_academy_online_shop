import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_academy_online_shop/di/di.dart';
import 'package:flutter_academy_online_shop/router/router_config.dart';
import 'package:flutter_academy_online_shop/domain/models/product.dart';
import 'package:flutter_academy_online_shop/presentation/store/shop_store.dart';
import 'package:flutter_academy_online_shop/presentation/widgets/product_image.dart';
import 'package:flutter_academy_online_shop/presentation/widgets/item_counter.dart';

class ShoppingCartItem extends StatelessWidget {
  ShoppingCartItem({
    super.key,
    required this.product,
    required this.amount,
  });

  final Product product;
  final int amount;

  final _store = DI.get<ShopStore>();

  void _showDeleteDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        content: Text(AppLocalizations.of(context)!.deleteDialogContent),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(AppLocalizations.of(context)!.deleteDialogCancel),
          ),
          TextButton(
            onPressed: () {
              _store.deleteFromCart(product);
              Navigator.pop(context);
            },
            child: Text(AppLocalizations.of(context)!.deleteDialogOk),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.goNamed(AppRouter.detailsName,
            pathParameters: {'id': product.id.toString()});
      },
      child: Card(
        clipBehavior: Clip.antiAlias,
        child: Row(
          children: [
            Container(
              height: 175,
              width: 120,
              clipBehavior: Clip.antiAlias,
              padding: const EdgeInsets.all(10),
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
              child: ProductImage(imageUrl: product.image),
            ),
            Expanded(
              child: Container(
                height: 175,
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.centerRight,
                      child: IconButton(
                        onPressed: () {
                          _showDeleteDialog(context);
                        },
                        icon: const Icon(Icons.delete),
                      ),
                    ),
                    Expanded(
                      child: SizedBox(
                        width: double.infinity,
                        child: Text(
                          product.title,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        ItemCounter(
                          counter: amount,
                          onDecrement: () {
                            if (amount != 1) {
                              _store.updateCart(product, -1);
                            } else {
                              _showDeleteDialog(context);
                            }
                          },
                          onIncrement: () {
                            _store.updateCart(product, 1);
                          },
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
