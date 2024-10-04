import 'dart:developer' show log;

import 'package:beginnerapp/model/followers_model.dart';
import 'package:beginnerapp/screen/launch_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class App extends StatelessWidget {
  const App({super.key,required this.loadingData,});
  final List<FollowersModel>? loadingData;

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
          log("Detected device language: Language code: ${locale.languageCode}, Country code: ${locale.countryCode}");

          for (var supportedLocale in supportedLocales) {
            if (supportedLocale.languageCode == locale.languageCode &&
                locale.countryCode == locale.countryCode) {
              return supportedLocale;
            }
          }
        }
        log("The detected device language is not among the supported languages.");

        log("Language in which to launch the application: Launguage code: ${supportedLocales.first.languageCode}, Contry code: ${supportedLocales.first.countryCode}");
        return supportedLocales.first;
      },
      home: HomePage(title: 'API', followersData:loadingData),
    );
  }
}
