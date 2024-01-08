import 'package:business_ideas/entities/idea.dart';
import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;

class IdeaRepository {
  Future<List<Idea>> getIdeas() async {
    String jsonString = await rootBundle.loadString('res/test.json');
    List<dynamic> jsonList = json.decode(jsonString)["ideas"];
    List<Idea> ideas = jsonList.map((e) => loadIdea(e)).toList();
    return ideas;
  }

  Idea loadIdea(dynamic json) {
    Idea idea = Idea.fromJson(json);
    return idea;
  }
}
