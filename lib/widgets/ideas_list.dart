import 'package:animations/animations.dart';
import 'package:business_ideas/config/colors.dart';
import 'package:business_ideas/config/translation.dart';
import 'package:business_ideas/entities/idea.dart';
import 'package:business_ideas/repositories/idea_provider.dart';
import 'package:business_ideas/widgets/ad_example.dart';
import 'package:business_ideas/widgets/config_drawer.dart';
import 'package:business_ideas/widgets/top_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'idea_page.dart';
import 'idea_tile.dart';

class IdeasList extends ConsumerWidget {
  const IdeasList({super.key, required this.category});
  final Category category;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncIdeas = ref.watch(asyncIdeaProvider);
    return switch (asyncIdeas) {
      AsyncData(:final value) => Scaffold(
          appBar: TopBar.build(Translation.translateCategory(category),
              AppColors.categoryColors[category]!),
          endDrawer: ConfigDrawer.getDrawer(context, ref),
          body: ListView.builder(
            itemCount: value[category]!.length * 2,
            itemBuilder: (context, index) {
              return OpenContainer(
                transitionDuration: const Duration(milliseconds: 1000),
                transitionType: ContainerTransitionType.fadeThrough,
                closedBuilder: (context, action) {
                  if (index == 2 || index == 3) {
                    return const NativeExample();
                  }
                  Idea idea = value[category]![index];
                  return IdeaTile(idea: idea);
                },
                openBuilder: (context, action) {
                  Idea idea = value[category]![index];
                  return IdeaPage(id: idea.id, category: idea.category);
                },
              );
            },
          ),
        ),
      AsyncError(:final error) => Text('Error: $error'),
      _ => const Center(child: CircularProgressIndicator()),
    };
  }
}
