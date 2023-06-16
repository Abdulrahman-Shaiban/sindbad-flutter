import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/emuns/favorite_status_enum.dart';
import 'change_product_favorite_status_state.dart';

class ChangeProductFavoriteStatusStateNotifier
    extends StateNotifier<ChangeProductFavoriteStatusState> {
  ChangeProductFavoriteStatusStateNotifier()
      : super(const ChangeProductFavoriteStatusInitial());

  Future<void> changeProductFavoriteStates(
      {int? index, required FavoriteStatus favoriteStatus}) async {
    try {
      state = ChangeProductFavoriteStatusLoading(
        index: index,
      );
      // final addToFavoritesResponse =
      //     await _favoritesRepository.changeProductFavoriteStates();
      const addToFavoritesResponse = 'Success';
      state = ChangeProductFavoriteStatusLoaded(
        message: addToFavoritesResponse,
        index: index,
        favoriteStatus: favoriteStatus,
      );
    } catch (e) {
      state = const ChangeProductFavoriteStatusError(error: 'Error');
    }
  }

  deleteFromFavoriteList({
    required int index,
  }) async {
    try {
      state = ChangeProductFavoriteStatusLoading(
          index: index,);
      // final deleteFromFavoritesResponse =
      //     await _favoritesRepository.changeProductFavoriteStates();
      const deleteFromFavoritesResponse = 'Success';
      state = DeleteProductFromFavoriteLoaded(
        message: deleteFromFavoritesResponse,
        index: index,
      );
    } catch (e) {
      state = const ChangeProductFavoriteStatusError(error: 'Error');
    }
  }
}
