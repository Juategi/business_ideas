import 'package:animations/animations.dart';
import 'package:business_ideas/entities/idea.dart';
import 'package:flutter/material.dart';

class IdeasList extends StatelessWidget {
  const IdeasList({super.key, required this.ideas});
  final List<Idea> ideas;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: ideas.length,
      itemBuilder: (context, index) {
        return OpenContainer(
          transitionDuration: const Duration(seconds: 1),
          transitionType: ContainerTransitionType.fade,
          closedBuilder: (context, action) {
            return ListTile(
              title: Text(ideas[index].title),
              subtitle: Text(ideas[index].smallDescription),
            );
          },
          openBuilder: (context, action) {
            return Scaffold(
              appBar: AppBar(
                title: Text(ideas[index].title),
              ),
              body: Column(
                children: [
                  Text(ideas[index].description),
                  Expanded(
                    child: ListView.builder(
                      itemCount: ideas[index].steps.length,
                      itemBuilder: (context, index2) {
                        return ListTile(
                          title: Text(ideas[index].steps[index2]),
                        );
                      },
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
