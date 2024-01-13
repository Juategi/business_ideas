import 'package:business_ideas/entities/idea.dart';
import 'package:flutter/material.dart';

class IdeaTile extends StatelessWidget {
  const IdeaTile({super.key, required this.idea});
  final Idea idea;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(idea.title),
      subtitle: Text(idea.smallDescription),
    );
  }
}
