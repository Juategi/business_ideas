import 'package:business_ideas/config/colors.dart';
import 'package:business_ideas/entities/idea.dart';
import 'package:business_ideas/repositories/idea_provider.dart';
import 'package:business_ideas/widgets/config_drawer.dart';
import 'package:business_ideas/widgets/top_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class IdeaPage extends ConsumerWidget {
  const IdeaPage({super.key, required this.id, required this.category});
  final String id;
  final Category category;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncIdeas = ref.watch(asyncIdeaProvider);
    return asyncIdeas.when(
      data: (ideas) {
        Idea idea = ideas[category]!.firstWhere((element) => element.id == id);
        return Scaffold(
          appBar: TopBar.build(
              idea.title, AppColors.categoryColors[idea.category]!),
          endDrawer: ConfigDrawer.getDrawer(context, ref),
          body: Padding(
            padding: const EdgeInsets.all(26),
            child: ListView(
              children: [
                Text(idea.description),
                const SizedBox(height: 16),
                Column(
                  children: idea.steps
                      .map((e) => ListTile(
                            leading: const Icon(Icons.circle, size: 10),
                            title:
                                Text(e, style: const TextStyle(fontSize: 18)),
                          ))
                      .toList(),
                )
              ],
            ),
          ),
        );
      },
      error: (error, stack) => Text('Error: $error'),
      loading: () => const Center(child: CircularProgressIndicator()),
    );
  }
}
