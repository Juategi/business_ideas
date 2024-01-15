import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FavoriteNotifier extends AsyncNotifier<List<String>> {
  @override
  Future<List<String>> build() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> favorites = prefs.getStringList('favorites') ?? [];
    return favorites;
  }

  Future<void> toggle(String id) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      List<String> favorites = prefs.getStringList('favorites') ?? [];
      if (favorites.contains(id)) {
        favorites.remove(id);
      } else {
        favorites.add(id);
      }
      prefs.setStringList('favorites', favorites);
      return favorites;
    });
  }
}

final asyncFavoritesProvider =
    AsyncNotifierProvider<FavoriteNotifier, List<String>>(() {
  return FavoriteNotifier();
});
