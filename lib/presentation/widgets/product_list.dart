import 'package:flutter/material.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_academy_online_shop/domain/models/product.dart';
import 'package:flutter_academy_online_shop/presentation/widgets/product_list_item.dart';

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
      child: products.isNotEmpty
          ? GridView.count(
              padding: const EdgeInsets.only(bottom: 20),
              primary: false,
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              // childAspectRatio: MediaQuery.of(context).size.height / 900,
              children: products
                  .map(
                    (p) => ProductListItem(
                      id: p.id,
                      title: p.title,
                      price: p.price,
                      image: p.image,
                    ),
                  )
                  .toList(),
            )
          : Center(
              child: Text(AppLocalizations.of(context)!.noProducts),
            ),
    );
  }
}
