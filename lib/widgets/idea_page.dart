import 'package:business_ideas/entities/idea.dart';
import 'package:business_ideas/widgets/config_drawer.dart';
import 'package:flutter/material.dart';

class IdeaPage extends StatelessWidget {
  const IdeaPage({super.key, required this.idea});
  final Idea idea;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(idea.title),
      ),
      endDrawer: ConfigDrawer.getDrawer(context),
      body: Column(
        children: [
          Text(idea.description),
          Expanded(
            child: ListView.builder(
              itemCount: idea.steps.length,
              itemBuilder: (context, index2) {
                return ListTile(
                  title: Text(idea.steps[index2]),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
