import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'get_favorites/favorites_state.dart';
import 'get_favorites/favorites_state_notifier.dart';


final favoritesStateStateNotifierProvider =
StateNotifierProvider<FavoritesStateStateNotifier, FavoritesState>(
      (ref) => FavoritesStateStateNotifier(),
);


class FavoritesViewController {
  late WidgetRef ref;

  FavoritesViewController({required this.ref});

  Future<void> fetchFavorites() async {
    await ref
        .read(favoritesStateStateNotifierProvider.notifier)
        .fetchFavorites();
  }


}
