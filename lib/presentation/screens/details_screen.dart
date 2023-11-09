import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_academy_online_shop/presentation/store/shop_store.dart';
import 'package:flutter_academy_online_shop/di/di.dart';
import 'package:flutter_academy_online_shop/domain/models/product.dart';
import 'package:flutter_academy_online_shop/presentation/widgets/item_counter.dart';

class DetailsScreen extends StatefulWidget {
  const DetailsScreen({
    super.key,
    required this.id,
  });

  final int id;

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  final _store = DI.get<ShopStore>();

  int counter = 0;
  bool showSuccessMsg = false;

  void incrementCounter() {
    setState(() {
      counter++;
    });
  }

  void decrementCounter() {
    if (counter == 0) {
      return;
    } else {
      setState(() {
        counter--;
      });
    }
  }

  void _onAddToCart(int id) {
    _store.addToCart(id, counter);
    final snackBar = SnackBar(
      content: Text(AppLocalizations.of(context)!.addToCartSuccess),
    );

    // Find the ScaffoldMessenger in the widget tree
    // and use it to show a SnackBar.
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
    setState(() {
      counter = 0;
    });
  }

  @override
  Widget build(final BuildContext context) {
    final product =
        _store.allProducts.firstWhere((Product p) => p.id == widget.id);

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
              height: 300,
              padding: const EdgeInsets.all(20),
              clipBehavior: Clip.antiAlias,
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
                fit: BoxFit.contain,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(right: 20),
                            child: Text(
                              product.title,
                              style: const TextStyle(
                                fontSize: 24,
                              ),
                            ),
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              "Rating: ${product.rating.rate}/5",
                              textAlign: TextAlign.right,
                              style: const TextStyle(
                                fontSize: 18,
                              ),
                            ),
                            Text(
                              "\$${product.price.toStringAsFixed(2)}",
                              textAlign: TextAlign.right,
                              style: const TextStyle(
                                fontSize: 24,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Text(
                    product.description,
                    style: const TextStyle(fontSize: 20),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ItemCounter(
                              counter: counter,
                              onDecrement: decrementCounter,
                              onIncrement: incrementCounter,
                            ),
                            counter > 0
                                ? Text(
                                    '${AppLocalizations.of(context)!.total}: \$${(counter * product.price).toStringAsFixed(2)}',
                                    style: const TextStyle(fontSize: 20),
                                  )
                                : const SizedBox.shrink(),
                          ],
                        ),
                        FilledButton(
                          onPressed: counter > 0
                              ? () {
                                  _onAddToCart(product.id);
                                }
                              : null,
                          child: Text(
                            AppLocalizations.of(context)!.addToCart,
                            style: const TextStyle(
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ],
                    ),
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
