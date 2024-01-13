import 'package:animations/animations.dart';
import 'package:business_ideas/entities/idea.dart';
import 'package:flutter/material.dart';

import 'idea_page.dart';
import 'idea_tile.dart';

class IdeasList extends StatelessWidget {
  const IdeasList({super.key, required this.ideas});
  final List<Idea> ideas;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
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
    );
  }
}
