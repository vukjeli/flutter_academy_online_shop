import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_academy_online_shop/router/router_config.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(final BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppLocalizations.of(context)!.loginPageTitle,
          style: const TextStyle(color: Colors.white),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Center(
          child: TextButton(
            child: const Text('Login'),
            onPressed: () => context.goNamed(AppRouter.shopName),
          ),
        ),
      ),
    );
  }
}
// Text(AppLocalizations.of(context)!.helloWorld),
