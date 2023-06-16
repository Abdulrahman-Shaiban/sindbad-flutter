import 'package:sindebad/features/products/data/models/product.dart';

import '../../data/models/category.dart';

abstract class CategoryProductsState {
  const CategoryProductsState();
}

class CategoryProductsInitial extends CategoryProductsState {
  const CategoryProductsInitial();
}

class CategoryProductsLoading extends CategoryProductsState {
  const CategoryProductsLoading();
}

class CategoryProductsLoaded extends CategoryProductsState {
  final List<Product> products;

  const CategoryProductsLoaded({required this.products});

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is CategoryProductsLoaded && other.products == products;
  }

  @override
  int get hashCode => products.hashCode;
}

class CategoryProductsError extends CategoryProductsState {
  final String error;

  const CategoryProductsError({required this.error});

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is CategoryProductsError && other.error == error;
  }

  @override
  int get hashCode => error.hashCode;
}
