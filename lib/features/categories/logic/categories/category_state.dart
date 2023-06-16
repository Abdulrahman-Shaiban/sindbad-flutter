import '../../data/models/category.dart';

abstract class CategoryState {
  const CategoryState();
}

class CategoriesInitial extends CategoryState {
  const CategoriesInitial();
}

class CategoriesLoading extends CategoryState {
  const CategoriesLoading();
}

class CategoriesLoaded extends CategoryState {
  final List<Category> categories;

  const CategoriesLoaded({required this.categories});

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is CategoriesLoaded && other.categories == categories;
  }

  @override
  int get hashCode => categories.hashCode;
}

class CategoriesError extends CategoryState {
  final String error;

  const CategoriesError({required this.error});

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is CategoriesError && other.error == error;
  }

  @override
  int get hashCode => error.hashCode;
}
