import 'package:animations/animations.dart';
import 'package:business_ideas/entities/idea.dart';
import 'package:business_ideas/main.dart';
import 'package:business_ideas/repositories/idea_repository.dart';
import 'package:business_ideas/repositories/locale_repository.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final IdeaRepository ideaRepository = GetIt.I<IdeaRepository>();
  final LocaleRepository localeRepository = GetIt.I<LocaleRepository>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Business Ideas"),
        actions: [
          IconButton(
            icon: Icon(Icons.light_mode),
            onPressed: () {
              MyApp.of(context).changeTheme();
            },
          ),
          IconButton(
            icon: Icon(Icons.language),
            onPressed: () {
              localeRepository.setLangCode("en");
              MyApp.of(context)
                  .setLocale(Locale.fromSubtags(languageCode: 'en'));
            },
          ),
        ],
      ),
      body: FutureBuilder(
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<Idea> ideas = snapshot.data as List<Idea>;
            return ListView.builder(
              itemCount: ideas.length,
              itemBuilder: (context, index) {
                return OpenContainer(
                  transitionDuration: const Duration(seconds: 1),
                  transitionType: ContainerTransitionType.fade,
                  closedBuilder: (context, action) {
                    return ListTile(
                      title: Text(ideas[index].title),
                      subtitle: Text(ideas[index].description),
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
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
        future: IdeaRepository().getIdeas(),
      ),
    );
  }
}
