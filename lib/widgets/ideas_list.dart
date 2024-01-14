import 'package:animations/animations.dart';
import 'package:business_ideas/config/colors.dart';
import 'package:business_ideas/config/translation.dart';
import 'package:business_ideas/entities/idea.dart';
import 'package:business_ideas/widgets/config_drawer.dart';
import 'package:business_ideas/widgets/top_bar.dart';
import 'package:flutter/material.dart';

import 'idea_page.dart';
import 'idea_tile.dart';

class IdeasList extends StatelessWidget {
  const IdeasList({super.key, required this.ideas, required this.category});
  final List<Idea> ideas;
  final Category category;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TopBar.build(Translation.translateCategory(category),
          AppColors.categoryColors[category]!),
      endDrawer: ConfigDrawer.getDrawer(context),
      body: ListView.builder(
        itemCount: ideas.length,
        itemBuilder: (context, index) {
          Idea idea = ideas[index];
          return OpenContainer(
            transitionDuration: const Duration(seconds: 1),
            transitionType: ContainerTransitionType.fade,
            closedBuilder: (context, action) {
              return IdeaTile(idea: idea);
            },
            openBuilder: (context, action) {
              return IdeaPage(idea: idea);
            },
          );
        },
      ),
    );
  }
}
