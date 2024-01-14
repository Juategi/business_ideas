import 'package:business_ideas/main.dart';
import 'package:business_ideas/repositories/locale_repository.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class ConfigDrawer {
  static Drawer getDrawer(BuildContext context) {
    final LocaleRepository localeRepository = GetIt.I<LocaleRepository>();
    return Drawer(
      child: ListView(
        children: [
          ListTile(
            title: const Text('English'),
            onTap: () {
              Navigator.pop(context);
              localeRepository.setLangCode("en");
              MyApp.of(context)
                  .setLocale(const Locale.fromSubtags(languageCode: 'en'));
            },
          ),
          ListTile(
            title: const Text('Español'),
            onTap: () {
              Navigator.pop(context);
              localeRepository.setLangCode("es");
              MyApp.of(context)
                  .setLocale(const Locale.fromSubtags(languageCode: 'es'));
            },
          ),
          ListTile(
            title: const Text('Deutsch'),
            onTap: () {
              Navigator.pop(context);
              localeRepository.setLangCode("de");
              MyApp.of(context)
                  .setLocale(const Locale.fromSubtags(languageCode: 'de'));
            },
          ),
          ListTile(
            title: const Text('Français'),
            onTap: () {
              Navigator.pop(context);
              localeRepository.setLangCode("fr");
              MyApp.of(context)
                  .setLocale(const Locale.fromSubtags(languageCode: 'fr'));
            },
          ),
          IconButton(
            icon: const Icon(Icons.light_mode),
            onPressed: () {
              MyApp.of(context).changeTheme();
            },
          ),
        ],
      ),
    );
  }
}
