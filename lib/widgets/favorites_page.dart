import 'package:animations/animations.dart';
import 'package:business_ideas/config/colors.dart';
import 'package:business_ideas/config/translation.dart';
import 'package:business_ideas/entities/idea.dart';
import 'package:business_ideas/repositories/favorite_idea_provider.dart';
import 'package:business_ideas/widgets/idea_page.dart';
import 'package:business_ideas/widgets/idea_tile.dart';
import 'package:business_ideas/widgets/top_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FavoritePage extends ConsumerWidget {
  const FavoritePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncFavoriteIdeas = ref.watch(favoriteIdeasProvider);
    return Scaffold(
      appBar: TopBar.build(
        Translation.translateText('favorites'),
        AppColors.appBarColor,
        endWidget: const SizedBox.shrink(),
      ),
      body: ListView.builder(
        itemCount: asyncFavoriteIdeas.length,
        itemBuilder: (context, index) {
          Idea idea = asyncFavoriteIdeas[index];
          return OpenContainer(
            transitionDuration: const Duration(milliseconds: 1000),
            transitionType: ContainerTransitionType.fadeThrough,
            closedBuilder: (context, action) {
              return IdeaTile(idea: idea);
            },
            openBuilder: (context, action) {
              return IdeaPage(id: idea.id, category: idea.category);
            },
          );
        },
      ),
    );
  }
}
