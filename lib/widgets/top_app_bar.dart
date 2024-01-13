import 'package:business_ideas/main.dart';
import 'package:business_ideas/repositories/locale_repository.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class TopAppBar {
  final LocaleRepository localeRepository = GetIt.I<LocaleRepository>();

  AppBar build(BuildContext context) {
    return AppBar(
      title: const Text("Business Ideas"),
      actions: [
        IconButton(
          icon: Icon(Icons.light_mode),
          onPressed: () {
            MyApp.of(context).changeTheme();
          },
        ),
        IconButton(
          icon: Icon(Icons.language),
          onPressed: () {
            localeRepository.setLangCode("en");
            MyApp.of(context).setLocale(Locale.fromSubtags(languageCode: 'en'));
          },
        ),
      ],
    );
  }
}
