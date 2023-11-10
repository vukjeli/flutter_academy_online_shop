import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:flutter_academy_online_shop/di/di.dart';
import 'package:flutter_academy_online_shop/router/router_config.dart';
import 'package:flutter_academy_online_shop/presentation/store/shop_store.dart';
import 'package:flutter_academy_online_shop/presentation/widgets/product_image.dart';
import 'package:flutter_academy_online_shop/presentation/widgets/item_counter.dart';

class ShoppingCartItem extends StatelessWidget {
  ShoppingCartItem({
    super.key,
    required this.id,
    required this.counter,
    required this.title,
    required this.imageUrl,
    required this.itemIndex,
  });

  final int id;
  final int counter;
  final String title;
  final String imageUrl;
  final int itemIndex;

  final _store = DI.get<ShopStore>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.goNamed(AppRouter.detailsName,
            pathParameters: {'id': id.toString()});
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
              child: ProductImage(imageUrl: imageUrl),
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
                          _store.removeFromCart(itemIndex);
                        },
                        icon: const Icon(Icons.delete),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        color: Colors.lightBlue,
                        width: double.infinity,
                        child: Text(
                          title.length > 25
                              ? '${title.substring(0, 25)}...'
                              : title,
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
                          counter: counter,
                          onDecrement: () {},
                          onIncrement: () {},
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
