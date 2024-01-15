import 'package:business_ideas/entities/idea.dart';
import 'package:business_ideas/repositories/favorite_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FavoriteButton extends ConsumerWidget {
  const FavoriteButton({super.key, required this.idea});
  final Idea idea;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncFavorites = ref.watch(asyncFavoritesProvider);
    return switch (asyncFavorites) {
      AsyncData(:final value) => IconButton(
          icon: Icon(
            Icons.favorite,
            color: value.contains(idea.id) ? Colors.red : Colors.grey,
          ),
          onPressed: () {
            ref
                .read(asyncFavoritesProvider.notifier)
                .toggle(idea.id.toString());
          },
        ),
      _ => const SizedBox.shrink(),
    };
  }
}
