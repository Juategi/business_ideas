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

  Map<String, Color> categoriasColores = {
    'Tecnología y Software': Color(0xFF3498db), // Azul
    'Comercio Electrónico': Color(0xFF2ecc71), // Verde esmeralda
    'Alimentación y Bebidas': Color(0xFFe74c3c), // Rojo alizarina
    'Salud y Bienestar': Color(0xFF27ae60), // Verde esmeralda oscuro
    'Educación y Formación': Color(0xFFf39c12), // Naranja
    'Entretenimiento y Medios': Color(0xFF8e44ad), // Púrpura
    'Servicios Profesionales': Color(0xFF3498db), // Azul
    'Turismo y Hospitalidad': Color(0xFFf39c12), // Naranja
    'Sostenibilidad y Medio Ambiente': Color(0xFF2ecc71), // Verde esmeralda
    'Moda y Estilo de Vida': Color(0xFFd35400), // Zanahoria
    'Finanzas y Tecnología Financiera': Color(0xFFf39c12), // Naranja
    'Innovación en la Movilidad': Color(0xFF27ae60), // Verde esmeralda oscuro
    'Sector Inmobiliario': Color(0xFFe74c3c), // Rojo alizarina
  };

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
              itemCount: Category.values.length,
              itemBuilder: (context, index) {
                return OpenContainer(
                  transitionDuration: const Duration(seconds: 1),
                  transitionType: ContainerTransitionType.fade,
                  closedBuilder: (context, action) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          gradient: LinearGradient(
                            colors: [Color(0xFF3498db), Color(0xFF2ecc71)],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                        ),
                        child: ListTile(
                          title: Text(
                            Category.values[index].toString().split('.')[1],
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              fontFamily: 'Montserrat',
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                  openBuilder: (context, action) {
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
                                          title:
                                              Text(ideas[index].steps[index2]),
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


/*
ListView.builder(
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
            */