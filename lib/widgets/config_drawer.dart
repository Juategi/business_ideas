import 'package:business_ideas/main.dart';
import 'package:business_ideas/repositories/idea_provider.dart';
import 'package:business_ideas/repositories/locale_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';

class ConfigDrawer {
  static final LocaleRepository localeRepository = GetIt.I<LocaleRepository>();
  static Drawer getDrawer(BuildContext context, WidgetRef ref) {
    return Drawer(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Row(
              children: [
                const Icon(Icons.language),
                const SizedBox(width: 16),
                DropdownButton<String>(
                  value: localeRepository.getLangCode(),
                  onChanged: (String? langCode) {
                    if (langCode != null) {
                      _changeLocale(context, langCode, ref);
                    }
                  },
                  underline: const SizedBox(),
                  items: const [
                    DropdownMenuItem(
                      value: "en",
                      child: Text('English'),
                    ),
                    DropdownMenuItem(
                      value: "es",
                      child: Text('Español'),
                    ),
                    DropdownMenuItem(
                      value: "de",
                      child: Text('Deutsch'),
                    ),
                    DropdownMenuItem(
                      value: "fr",
                      child: Text('Français'),
                    ),
                  ],
                ),
              ],
            ),
            /*IconButton(
              icon: const Icon(Icons.light_mode),
              onPressed: () {
                MyApp.of(context).changeTheme();
              },
            ),
            */
          ],
        ),
      ),
    );
  }

  static void _changeLocale(
      BuildContext context, String langCode, WidgetRef ref) {
    Navigator.pop(context);
    localeRepository.setLangCode(langCode);
    MyApp.of(context).setLocale(Locale.fromSubtags(languageCode: langCode));
    ref.read(asyncIdeaProvider.notifier).refresh();
  }
}
