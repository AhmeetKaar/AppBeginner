import 'dart:developer' show log;

import 'package:beginnerapp/page/first_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Localization',
      debugShowCheckedModeBanner: false,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      localeResolutionCallback:
          (Locale? locale, Iterable<Locale> supportedLocales) {
        if (locale != null) {
          log("Algılanan cihaz dili: Dil Kodu: ${locale.languageCode}, Ülke Kodu: ${locale.countryCode}");

          for (var supportedLocale in supportedLocales) {
            if (supportedLocale.languageCode == locale.languageCode &&
                locale.countryCode == locale.countryCode) {
              return supportedLocale;
            }
          }
        }
        log("Algılanan cihaz dili desteklenen diller arasında bulunmuyor.");

        log("Uygulamanın başlatılması istenen dil: Dil Kodu: ${supportedLocales.first.languageCode}, Ülke Kodu: ${supportedLocales.first.countryCode}");
        return supportedLocales.first;
      },
      home: const HomePage(title: 'API'),
    );
  }
}
