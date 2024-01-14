import 'package:animations/animations.dart';
import 'package:business_ideas/entities/idea.dart';
import 'package:business_ideas/repositories/idea_repository.dart';
import 'package:business_ideas/widgets/config_drawer.dart';
import 'package:business_ideas/widgets/ideas_list.dart';
import 'package:business_ideas/widgets/top_bar.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'category_tile.dart';

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
      appBar: TopBar.build("Business Ideas", Colors.purple.shade800),
      endDrawer: ConfigDrawer.getDrawer(context),
      body: FutureBuilder(
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<Idea> ideas = snapshot.data as List<Idea>;
            return Container(
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
                      return IdeasList(
                          ideas: ideas, category: Category.values[index]);
                    },
                  );
                },
              ),
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
