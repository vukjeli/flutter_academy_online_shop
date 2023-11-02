import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:go_router/go_router.dart';
// Local imports
import 'package:flutter_academy_online_shop/router/router_config.dart';

class ShopScreen extends StatelessWidget {
  const ShopScreen({super.key});

  @override
  Widget build(final BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppLocalizations.of(context)!.shopPageTitle,
          style: const TextStyle(color: Colors.white),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Center(
          child: TextButton(
            child: const Text('Click for more details'),
            onPressed: () => context
                .goNamed(AppRouter.detailsName, pathParameters: {'id': '20'}),
          ),
        ),
      ),
    );
  }
}
// Text(AppLocalizations.of(context)!.helloWorld),
