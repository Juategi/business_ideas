import 'package:business_ideas/entities/idea.dart';
import 'package:business_ideas/repositories/locale_repository.dart';
import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import 'package:get_it/get_it.dart';

class IdeaRepository {
  Future<List<Idea>> getIdeas() async {
    String jsonString = await rootBundle.loadString('test.json');
    List<dynamic> jsonList = json.decode(jsonString)["ideas"];
    Category category = Category.tech;
    List<Idea> ideas = jsonList.map((e) => loadIdea(e, category)).toList();
    return ideas;
  }

  Idea loadIdea(dynamic json, Category category) {
    LocaleRepository localeRepository = GetIt.I<LocaleRepository>();
    Idea idea = Idea.fromJson(json, localeRepository.getLangCode(), category);
    return idea;
  }
}
