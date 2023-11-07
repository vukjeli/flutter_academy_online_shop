import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:flutter_academy_online_shop/router/router_config.dart';
import 'package:flutter_academy_online_shop/domain/models/product.dart';

class ProductList extends StatelessWidget {
  const ProductList({super.key, required this.products});

  final List<Product> products;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 20,
        right: 20,
        left: 20,
      ),
      child: GridView.count(
        padding: const EdgeInsets.only(bottom: 20),
        primary: false,
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        children: products
            .map(
              (p) => Container(
                padding: const EdgeInsets.all(8),
                color: Colors.teal[100],
                child: TextButton(
                  child: Text(p.title),
                  onPressed: () => context.goNamed(AppRouter.detailsName,
                      pathParameters: {'id': p.id.toString()}),
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}
