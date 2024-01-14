import 'dart:async';

import 'package:business_ideas/entities/idea.dart';
import 'package:business_ideas/repositories/locale_repository.dart';
import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import 'package:get_it/get_it.dart';
import 'package:riverpod/riverpod.dart';

class IdeaNotifier extends AsyncNotifier<Map<Category, List<Idea>>> {
  @override
  FutureOr<Map<Category, List<Idea>>> build() {
    return getIdeas();
  }

  Future<void> refresh() async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      return getIdeas();
    });
  }

  Future<Map<Category, List<Idea>>> getIdeas() async {
    Map<Category, List<Idea>> ideas = {};
    String jsonString = await rootBundle.loadString('test.json');
    List<dynamic> jsonList = json.decode(jsonString)["ideas"];
    for (Category category in Category.values) {
      ideas[category] = jsonList.map((e) => _loadIdea(e, category)).toList();
    }
    return ideas;
  }

  Idea _loadIdea(dynamic json, Category category) {
    LocaleRepository localeRepository = GetIt.I<LocaleRepository>();
    Idea idea = Idea.fromJson(json, localeRepository.getLangCode(), category);
    return idea;
  }
}

final asyncIdeaProvider =
    AsyncNotifierProvider<IdeaNotifier, Map<Category, List<Idea>>>(() {
  return IdeaNotifier();
});
