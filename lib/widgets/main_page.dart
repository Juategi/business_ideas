import 'package:animations/animations.dart';
import 'package:business_ideas/config/colors.dart';
import 'package:business_ideas/entities/idea.dart';
import 'package:business_ideas/repositories/idea_provider.dart';
import 'package:business_ideas/widgets/config_drawer.dart';
import 'package:business_ideas/widgets/ideas_list.dart';
import 'package:business_ideas/widgets/top_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'category_tile.dart';

class MainPage extends ConsumerWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncIdeas = ref.watch(asyncIdeaProvider);
    return switch (asyncIdeas) {
      AsyncData() => Scaffold(
          appBar: TopBar.build("Business Ideas", AppColors.appBarColor),
          endDrawer: ConfigDrawer.getDrawer(context, ref),
          body: Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20.0),
              ),
            ),
            child: ListView.builder(
              itemCount: Category.values.length,
              itemBuilder: (context, index) {
                return OpenContainer(
                  transitionDuration: const Duration(seconds: 1),
                  transitionType: ContainerTransitionType.fade,
                  closedColor: Colors.white,
                  middleColor: Colors.white,
                  openColor: Colors.transparent,
                  closedBuilder: (context, action) {
                    return CategoryTile(category: Category.values[index]);
                  },
                  openBuilder: (context, action) {
                    return IdeasList(category: Category.values[index]);
                  },
                );
              },
            ),
          ),
        ),
      AsyncError(:final error) => Text('Error: $error'),
      _ => const Center(child: CircularProgressIndicator()),
    };
  }
}
