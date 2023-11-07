import 'package:flutter/material.dart';
import 'package:flutter_academy_online_shop/presentation/store/products_store.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import 'package:flutter_academy_online_shop/di/di.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ShopFilters extends StatefulWidget {
  const ShopFilters({super.key});

  @override
  State<ShopFilters> createState() => _ShopFiltersState();
}

class _ShopFiltersState extends State<ShopFilters> {
  final _store = DI.get<ProductsStore>();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding:
              const EdgeInsets.only(top: 30, right: 20, bottom: 10, left: 20),
          child: TextField(
            decoration: InputDecoration(
              hintText: AppLocalizations.of(context)!.searchHint,
              prefixIcon: const Icon(Icons.search),
              border: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(14)),
              ),
            ),
            onChanged: (String value) {
              _store.setSearchValue(value);
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          child: Text(
            AppLocalizations.of(context)!.categories,
            textAlign: TextAlign.left,
            style: const TextStyle(fontSize: 15),
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Observer(
              builder: (BuildContext context) {
                final categoriesWidgets = ["", ..._store.allCategories]
                    .map(
                      (category) => InkWell(
                        onTap: () {
                          _store.setSelectedCategory(category);
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 4, horizontal: 15),
                          decoration: BoxDecoration(
                            color: category == _store.selectedCategory
                                ? Theme.of(context).colorScheme.primary
                                : Theme.of(context).colorScheme.outlineVariant,
                            borderRadius:
                                const BorderRadius.all(Radius.circular(20)),
                          ),
                          child: Text(
                              category.isEmpty
                                  ? AppLocalizations.of(context)!.all
                                  : category,
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 18)),
                        ),
                      ),
                    )
                    .toList();

                return Wrap(
                  spacing: 20.0,
                  direction: Axis.horizontal,
                  children: categoriesWidgets,
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
