import 'package:flutter/material.dart';
import 'package:flutter_academy_online_shop/presentation/store/products_store.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_academy_online_shop/di/di.dart';
import 'package:flutter_academy_online_shop/domain/models/product.dart';

class DetailsScreen extends StatelessWidget {
  DetailsScreen({super.key, required this.id});

  final int id;

  final _store = DI.get<ProductsStore>();

  @override
  Widget build(final BuildContext context) {
    final product =
        _store.filteredProducts.firstWhere((Product p) => p.id == id);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppLocalizations.of(context)!.detailsPageTitle,
          style: const TextStyle(color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              // height: 300,
              padding: const EdgeInsets.all(20),
              // clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Theme.of(context).colorScheme.onBackground,
                    spreadRadius: 1,
                    blurRadius: 10,
                    offset: const Offset(0, 1),
                  ),
                ],
              ),
              child: Image(
                image: NetworkImage(
                  product.image,
                ),
                fit: BoxFit.fitWidth,
              ),
            ),
            Container(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  SizedBox(
                    width: double.infinity,
                    child: Text(
                      'Rating: ${product.rating.rate}/5',
                      textAlign: TextAlign.right,
                      style: const TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: Text(
                      product.title,
                      style: const TextStyle(
                        fontSize: 24,
                      ),
                    ),
                  ),
                  Text(
                    product.description,
                    style: const TextStyle(fontSize: 20),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
// Text(AppLocalizations.of(context)!.helloWorld),
