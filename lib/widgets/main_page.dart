import 'package:animations/animations.dart';
import 'package:business_ideas/entities/idea.dart';
import 'package:business_ideas/repositories/idea_repository.dart';
import 'package:business_ideas/widgets/ideas_list.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import 'category_tile.dart';
import 'top_app_bar.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final IdeaRepository ideaRepository = GetIt.I<IdeaRepository>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TopAppBar().build(context),
      body: FutureBuilder(
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<Idea> ideas = snapshot.data as List<Idea>;
            return ListView.builder(
              itemCount: Category.values.length,
              itemBuilder: (context, index) {
                return OpenContainer(
                  transitionDuration: const Duration(seconds: 1),
                  transitionType: ContainerTransitionType.fade,
                  closedBuilder: (context, action) {
                    return CategoryTile(category: Category.values[index]);
                  },
                  openBuilder: (context, action) {
                    return IdeasList(ideas: ideas);
                  },
                );
              },
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
        future: IdeaRepository().getIdeas(),
      ),
    );
  }
}
