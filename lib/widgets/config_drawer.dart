import 'package:business_ideas/main.dart';
import 'package:business_ideas/repositories/idea_provider.dart';
import 'package:business_ideas/repositories/locale_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';

class ConfigDrawer {
  static Drawer getDrawer(BuildContext context, WidgetRef ref) {
    return Drawer(
      child: ListView(
        children: [
          ListTile(
            title: const Text('English'),
            onTap: () => _changeLocale(context, "en", ref),
          ),
          ListTile(
            title: const Text('Español'),
            onTap: () => _changeLocale(context, "es", ref),
          ),
          ListTile(
            title: const Text('Deutsch'),
            onTap: () => _changeLocale(context, "de", ref),
          ),
          ListTile(
            title: const Text('Français'),
            onTap: () => _changeLocale(context, "fr", ref),
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

  static void _changeLocale(
      BuildContext context, String langCode, WidgetRef ref) {
    LocaleRepository localeRepository = GetIt.I<LocaleRepository>();
    Navigator.pop(context);
    localeRepository.setLangCode(langCode);
    MyApp.of(context).setLocale(Locale.fromSubtags(languageCode: langCode));
    ref.read(asyncIdeaProvider.notifier).refresh();
  }
}
