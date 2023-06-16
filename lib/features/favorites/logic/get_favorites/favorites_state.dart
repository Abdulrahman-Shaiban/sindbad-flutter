
import '../../../products/data/models/product.dart';

abstract class FavoritesState {
  const FavoritesState();
}

class FavoritesInitial extends FavoritesState {
  const FavoritesInitial();
}

class FavoritesLoading extends FavoritesState {
  const FavoritesLoading();
}

class FavoritesLoaded extends FavoritesState {
  final List<Product> favorites;

  const FavoritesLoaded({required this.favorites});

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FavoritesLoaded &&
          runtimeType == other.runtimeType &&
          favorites == other.favorites;

  @override
  int get hashCode => favorites.hashCode;
}

class FavoritesError extends FavoritesState {
  final String error;

  const FavoritesError({required this.error});

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is FavoritesError && other.error == error;
  }

  @override
  int get hashCode => error.hashCode;
}
