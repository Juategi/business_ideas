import 'package:animations/animations.dart';
import 'package:business_ideas/config/translation.dart';
import 'package:business_ideas/main.dart';
import 'package:business_ideas/repositories/idea_provider.dart';
import 'package:business_ideas/repositories/locale_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';

import 'favorites_page.dart';

class ConfigDrawer {
  static final LocaleRepository localeRepository = GetIt.I<LocaleRepository>();
  static Drawer getDrawer(BuildContext context, WidgetRef ref) {
    Color backgroundColor = Colors.white;
    return Drawer(
      backgroundColor: backgroundColor,
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
            const SizedBox(height: 16),
            OpenContainer(
              transitionDuration: const Duration(milliseconds: 1000),
              transitionType: ContainerTransitionType.fadeThrough,
              closedColor: backgroundColor.withOpacity(0),
              closedElevation: 0,
              closedBuilder: (context, action) {
                return MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: Row(
                    children: [
                      const Icon(Icons.favorite),
                      const SizedBox(width: 16),
                      Text(Translation.translateText("favorites")),
                    ],
                  ),
                );
              },
              openBuilder: (context, action) {
                return const FavoritePage();
              },
            ),
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
