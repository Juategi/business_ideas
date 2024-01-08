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
  IdeaRepository ideaRepository = GetIt.I<IdeaRepository>();
  LocaleRepository localeRepository = GetIt.I<LocaleRepository>();
  //Future<List<Idea>> ideas = IdeaRepository().getIdeas();

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
                return ListTile(
                  title: Text(ideas[index].title),
                  subtitle: Text(ideas[index].description),
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
