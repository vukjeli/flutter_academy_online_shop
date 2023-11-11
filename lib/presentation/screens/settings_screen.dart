import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(final BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppLocalizations.of(context)!.settingsPageTitle,
          style: const TextStyle(color: Colors.white),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  AppLocalizations.of(context)!.toggleTheme,
                  style: const TextStyle(
                    fontSize: 18,
                  ),
                ),
                const Spacer(),
                Switch(
                  value:
                      AdaptiveTheme.of(context).mode == AdaptiveThemeMode.dark,
                  onChanged: (value) {
                    print(value);
                    value
                        ? AdaptiveTheme.of(context).setDark()
                        : AdaptiveTheme.of(context).setLight();
                  },
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
// Text(AppLocalizations.of(context)!.helloWorld),
