import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:flutter_academy_online_shop/presentation/widgets/product_image.dart';
import 'package:flutter_academy_online_shop/router/router_config.dart';

class ProductListItem extends StatelessWidget {
  const ProductListItem({
    super.key,
    required this.id,
    required this.title,
    required this.price,
    required this.image,
  });

  final int id;
  final String title;
  final num price;
  final String image;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.goNamed(AppRouter.detailsName,
            pathParameters: {'id': id.toString()});
      },
      child: Card(
        color: Theme.of(context).colorScheme.outlineVariant,
        clipBehavior: Clip.antiAlias,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              color: Colors.white,
              height: 100,
              width: double.infinity,
              padding: const EdgeInsets.all(10),
              child: ProductImage(
                imageUrl: image,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
              child: Text(
                title.length > 15 ? '${title.substring(0, 15)}...' : title,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
