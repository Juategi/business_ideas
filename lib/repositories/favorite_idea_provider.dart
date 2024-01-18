import 'package:business_ideas/entities/idea.dart';
import 'package:business_ideas/repositories/favorite_provider.dart';
import 'package:business_ideas/repositories/idea_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final favoriteIdeasProvider = Provider<List<Idea>>((ref) {
  List<String> favorites = ref.watch(asyncFavoritesProvider).value ?? [];
  Map<Category, List<Idea>> ideas = ref.watch(asyncIdeaProvider).value ?? {};
  List<Idea> favoriteIdeas = [];
  for (Category category in Category.values) {
    for (Idea idea in ideas[category]!) {
      if (favorites.contains(idea.id.toString())) {
        favoriteIdeas.add(idea);
      }
    }
  }
  return favoriteIdeas;
});
