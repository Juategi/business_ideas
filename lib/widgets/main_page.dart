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

  Map<Category, Gradient> categoryColors = const {
    Category.tech: LinearGradient(
      colors: [Color(0xFF3498db), Color(0xFF2ecc71)],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    ),
    Category.webs: LinearGradient(
      colors: [Color(0xFFe67e22), Color(0xFFf1c40f)],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    ),
    Category.ecommerce: LinearGradient(
      colors: [Color(0xFF9b59b6), Color(0xFF8e44ad)],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    ),
    Category.food: LinearGradient(
      colors: [Color(0xFFe74c3c), Color(0xFFc0392b)],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    ),
    Category.health: LinearGradient(
      colors: [Color(0xFF1abc9c), Color(0xFF16a085)],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    ),
    Category.education: LinearGradient(
      colors: [Color(0xFF2ecc71), Color(0xFF27ae60)],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    ),
    Category.music: LinearGradient(
      colors: [Color(0xFF3498db), Color(0xFF2980b9)],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    ),
    Category.art: LinearGradient(
      colors: [Color(0xFF9b59b6), Color(0xFF8e44ad)],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    ),
    Category.sports: LinearGradient(
      colors: [Color(0xFFe67e22), Color(0xFFd35400)],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    ),
    Category.videogames: LinearGradient(
      colors: [Color(0xFFf1c40f), Color(0xFFf39c12)],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    ),
    Category.ai: LinearGradient(
      colors: [Color(0xFF9b59b6), Color(0xFF8e44ad)],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    ),
    Category.vr: LinearGradient(
      colors: [Color(0xFF3498db), Color(0xFF2980b9)],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    ),
    Category.professional: LinearGradient(
      colors: [Color(0xFF2ecc71), Color(0xFF27ae60)],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    ),
    Category.turism: LinearGradient(
      colors: [Color(0xFFe74c3c), Color(0xFFc0392b)],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    ),
    Category.environment: LinearGradient(
      colors: [Color(0xFF1abc9c), Color(0xFF16a085)],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    ),
    Category.fashion: LinearGradient(
      colors: [Color(0xFFe67e22), Color(0xFFd35400)],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    ),
    Category.finances: LinearGradient(
      colors: [Color(0xFFf1c40f), Color(0xFFf39c12)],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    ),
    Category.mobility: LinearGradient(
      colors: [Color(0xFF9b59b6), Color(0xFF8e44ad)],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    ),
    Category.realState: LinearGradient(
      colors: [Color(0xFF3498db), Color(0xFF2980b9)],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    ),
  };

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
