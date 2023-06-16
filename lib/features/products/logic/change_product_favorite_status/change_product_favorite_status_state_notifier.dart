import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/models/product.dart';
import 'change_product_favorite_status_state.dart';

class ChangeProductFavoriteStatusStateNotifier
    extends StateNotifier<ChangeProductFavoriteStatusState> {
  ChangeProductFavoriteStatusStateNotifier()
      : super(const ChangeProductFavoriteStatusInitial());

  Future<void> changeProductFavoriteStates({
    required Product product,
    int? index,
  }) async {
    try {
      state = ChangeProductFavoriteStatusLoading(
        index: index,
      );
      // final addToFavoritesResponse =
      //     await _favoritesRepository.changeProductFavoriteStates();
      state = const ChangeProductFavoriteStatusLoaded(
        message: 'Success',
      );
    } catch (e) {
      state = const ChangeProductFavoriteStatusError(error: 'Error');
    }
  }

  deleteFromFavoriteList({
    required Product product,
    required int index,
  }) async {
    try {
      state = const ChangeProductFavoriteStatusLoading();
      // final addToFavoritesResponse =
      //     await _favoritesRepository.deleteFromFavorites();
      state = const DeleteProductFromFavoriteLoaded(message: 'Success');
    } catch (e) {
      state = const ChangeProductFavoriteStatusError(error: 'Error');
    }
  }
}
